module Rails
  class << self
    def application
      :application
    end
  end
end

require 'reviewer'
require 'publisher'
require 'logger'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: ':memory:'
)

ActiveRecord::Schema.define do
  create_table :reviews do |t|
    t.belongs_to  :user,  index: true,  polymorphic: true
    t.references  :item,  index: true,  polymorphic: true
    t.timestamp   :accepted_at
    t.timestamp   :rejected_at
    t.timestamp   :cancelled_at
    t.timestamps  null: false
  end

  create_table :articles do |t|
    t.string      :name
    t.timestamps  null: false
  end

  create_table :users do |t|
    t.belongs_to  :article, index: true
    t.timestamps  null: false
  end
end

class Review < ActiveRecord::Base
  review!
end

class Article < ActiveRecord::Base
  publishable!
  has_many :users

  def reviewers
    users
  end
end

class User < ActiveRecord::Base
  belongs_to :article
end

Before do
  User.destroy_all
  Article.destroy_all
  Review.destroy_all
  expect(User.count).to eq(0)
  expect(Article.count).to eq(0)
  expect(Review.count).to eq(0)
end

# Review.states.each do |s|
#   Review.define_singleton_method(s) { Review.query(s) }
# end
#
# Article.states.each do |s|
#   Article.define_singleton_method(s) { Article.query(s) }
# end
