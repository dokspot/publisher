# publisher
[![Build Status](https://travis-ci.org/dokspot/publisher.svg?branch=master)](https://travis-ci.org/dokspot/publisher)
[![Code Climate](https://codeclimate.com/github/dokspot/publisher.svg)](https://codeclimate.com/github/dokspot/publisher)


publisher is the publishing feature used in dokspot. It can be easily attached to any model and allows the model to be published by users.

This gem uses the [reviewer](https://github.com/dokspot/reviewer) gem to power the review features.

## Usage

You can add it to your Gemfile with:
```ruby
gem 'publisher', github: 'dokspot/publisher'
```

Then run
```console
$ bundle install
```

Next, you need to run the [reviewer](https://github.com/dokspot/reviewer) generator. This creates a migration for the `reviews` table.

```console
$ rails g reviewer:install
```

Next, you need to run the following command. You will need to replace `MODEL` with the class name of the model you want to enable the publishing functionality on. This will create a model (if it does not exist) and configure it with the default publisher module.

```console
$ rails g publisher:install MODEL
```

Next, migrate the database:

```console
$ rails db:migrate
```

## Configuring Models

### Configuring your model to use `review!`
Add `review!` to your `Review` model and you will gain access to all the helper methods required.
```ruby
class Review < ActiveRecord::Base
  review!
end
```

NOTE: We recommend that you use a gem such as [method_callbacks](https://github.com/MorganShowman/method_callbacks) if you want to run any authorisation checks before users are allowed to `accept!` or `reject!`.

### Configuring your model to use `publishable!`
Add `publishable!` to your `Model` (we will use `Article` here) model and you will gain access to all the helper methods required.

`publishable!` also provides you access to all the API calls that `reviewable!` provides in [reviewer](https://github.com/dokspot/reviewer#reviewable-helper).

Additionally, you need to implement a couple methods to make reviewer play nicely with your application.
```ruby
class Arcticle < ActiveRecord::Base
  publishable!

  has_many :reviewers
  # Or you need a method called `reviewers` that returns an array of users.
  def reviewers
    Reviewer.all
  end
end
```

## API

### review! Helper

See [reviewer](https://github.com/dokspot/reviewer#review-helper)

### publishable! Helper

Inherits API calls from `reviewable!`, see [reviewer](https://github.com/dokspot/reviewer#reviewable-helper).

Additionally:
```ruby
# Scope
Article.publishable           # returns all objects that are ready to be published (same result as .reviewed)
Article.published             # returns all objects that are published
Article.retired               # returns all objects that are retired
# States
@article.publishable?
@article.published?
@article.retired?

# Helpers
@article.versionable?         # whether a new version can be created
@article.version_exists?      # whether a there are any versions associated with this record
@article.previous_version
@article.next_version

# Actions
@article.publish!             # publishes the record
@article.create_version!      # creates a new version of the record
```
