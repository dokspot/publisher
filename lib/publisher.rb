require 'publisher/version'
require 'reviewer/reviewable'
require 'active_record' unless defined?(ActiveRecord)

require 'active_support/concern'

module Publisher
  extend ActiveSupport::Concern

  module Publishable
    extend ActiveSupport::Concern
    include Reviewer::Reviewable

    included do
      belongs_to :next_version  , polymorphic: true , optional: true

      def publishable?
        reviewed? && !published? && !retired?
      end

      def published?
        published_at? && !retired?
      end

      def retired?
        retired_at?
      end

      def publish!
        raise ArgumentError, :not_allowed unless publishable?

        transaction do
          previous_version.retire if previous_version
          update(published_at: Time.now)
        end
      rescue => e
        e
      end

      def retire!
        raise ArgumentError, :not_allowed unless version_exists?
        update(retired_at: Time.now)
      rescue => e
        e
      end

      def versionable?
        published? && !next_version
      end

      def version_exists?
        previous_version || next_version
      end

      def previous_version
        self.class.find_by(next_version: self)
      end

      def create_version
        raise ArgumentError, :not_allowed unless versionable?

        transaction do
          # TODO: How to insert product_line_assignments and others
          # clone = deep_clone(include: [:product_line_assignments], except: [:approval_requested_at, :published_at, :retired_at], validate: false)
          # update(next_version: clone)
        end
      rescue => e
        e
      end

    end

    class_methods do
      def publishable
        all.select { |i| i.publishable? }
      end

      def published
        all.select { |i| i.published? }
      end

      def retired
        all.select { |i| i.retired? }
      end
    end

  end

  class_methods do
    def publishable!
      include Publisher::Publishable
    end
  end
end

ActiveRecord::Base.extend Publisher::ClassMethods
