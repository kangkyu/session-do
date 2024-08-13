source 'https://rubygems.org'

ruby '3.1.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.1.3'
# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11'
# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
gem 'debug', group: [:development, :test]

gem "haml-rails", "~> 2.0"
gem 'sprockets-rails', :require => 'sprockets/railtie'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.18.0', require: false

group :development, :test do
  gem 'rspec-rails', '~> 6.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
end

group :development do
  gem 'sqlite3', '~> 1.7.3'
  gem 'spring'
end

group :production do
  gem 'pg', "~> 1.1"
end

gem 'puma'
gem "redis"
gem 'rack-cors'

# gem 'importmap-rails'
gem "dartsass-rails", "~> 0.5.1"

gem 'cssbundling-rails'
gem 'jsbundling-rails'
gem 'turbo-rails'

gem "font-awesome-sass"
