source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby ">= 2.7.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false


group :development, :test do

    # Fake data generator
    # https://github.com/faker-ruby/faker
    gem "faker"

    # rspec-rails is a testing framework for Rails 5+.
    # https://github.com/rspec/rspec-rails
    # Using beta version of rspect-rails due: https://github.com/rails/rails/issues/35417
    gem "rspec-rails", "6.0.2"

end

group :development do

end

gem "lesli", path: "engines/Lesli"
