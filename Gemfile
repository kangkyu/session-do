source 'https://rubygems.org'

ruby '3.2.8'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 8.0.1'
# Use SCSS for stylesheets
gem 'sassc-rails'
# # Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'
# # See https://github.com/sstephenson/execjs#readme for more supported runtimes
# # gem 'therubyracer',  platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'haml'
gem 'haml-rails'

gem 'sprockets-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# TODO: seems not working with Turbo
# https://docs.fontawesome.com/web/use-with/ruby-on-rails
# gem 'font-awesome-sass', '~> 6.5.1'
# gem 'font-awesome-rails', '~> 4.7.0.8'

gem 'turbo-rails'
gem 'importmap-rails'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  gem 'rspec-rails'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem "selenium-webdriver"
end

group :development do
  gem 'sqlite3', ">= 1.4"
end

group :production do
  gem 'pg'
  # gem 'rails_12factor'
end

gem 'puma', '>= 5.0'
gem "redis", ">= 4.0.1"
gem 'rack-cors'

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "tailwindcss-rails", "~> 3.3.1"
