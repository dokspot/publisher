# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'publisher/version'

Gem::Specification.new do |spec|
  spec.name          = "publisher"
  spec.version       = Publisher::VERSION
  spec.authors       = ["cderche"]
  spec.email         = ["cyrille.derche@dokspot.com"]

  spec.summary       = "publisher is the publishing feature used in dokspot."
  spec.description   = "publisher is the publishing feature used in dokspot. It can be easily attached to any model and allows the model to be published by users"
  spec.homepage      = "http://dokspot.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "cucumber-rails"
  spec.add_development_dependency "rspec-expectations"
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rails"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "activesupport"
end
