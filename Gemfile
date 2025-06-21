=begin

Lesli

Copyright (c) 2023, Lesli Technologies, S. A.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see http://www.gnu.org/licenses/.

Lesli · Ruby on Rails SaaS Development Framework.

Made with ♥ by https://www.lesli.tech
Building a better future, one line of code at a time.

@contact  hello@lesli.tech
@website  https://www.lesli.tech
@license  GPLv3 http://www.gnu.org/licenses/gpl-3.0.en.html

// · ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~
// · 
=end

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.5"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
#gem "rails", "~> 8.0.0.rc1"
gem "rails", "~> 7.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.5"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 2.1.0"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "6.4.3"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem "honeybadger"

group :development, :test do
  # Fake data generator
  # https://github.com/faker-ruby/faker
  gem "faker"

  # Preview email in the default browser instead of sending it
  # https://github.com/ryanb/letter_opener
  gem "letter_opener", "1.10.0"

  # rspec-rails is a testing framework for Rails 5+.
  # https://github.com/rspec/rspec-rails
  # Using beta version of rspect-rails due: https://github.com/rails/rails/issues/35417
  gem "rspec-rails", "7.0.1"

  # Code coverage
  # https://github.com/simplecov-ruby/simplecov
  gem "simplecov", "0.21.2", require: false

  # Code coverage stats in the console
  # https://github.com/chetan/simplecov-console
  gem "simplecov-console", "0.9.2", require: false

  gem 'simplecov-cobertura'

  gem 'codecov', "0.6.0"

  gem 'rspec_junit_formatter', require: false

  # FactoryBot
  # https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#configure-your-test-suite
  gem "factory_bot_rails"

  gem 'brakeman', require: false

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end


# List of Lesli engines to be installed
eval_gemfile "Gemfile.lesli" if File.exist?("Gemfile.lesli")
