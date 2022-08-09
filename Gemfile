source 'https://rubygems.org'

ruby '3.0.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0.2'
# Use SCSS for stylesheets
gem 'sassc-rails', '~> 2.1.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'haml'
gem 'haml-rails'
gem 'bootstrap', '~> 4.6.1'
gem 'sprockets-rails', '~> 3.4.2'

# gem 'font-awesome-sass', '~> 4.2.0'
gem 'font-awesome-rails', '~> 4.7.0.0'

gem 'bootstrap-datepicker-rails'

gem 'turbo-rails'
gem 'importmap-rails'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'rspec-rails', '~> 5.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
end

group :development do
  gem 'sqlite3'
  gem 'spring'
end

group :production do
  gem 'pg', '>= 0.18', '< 2.0'
  gem 'rails_12factor'
  gem 'puma', '~> 5.0'
end
