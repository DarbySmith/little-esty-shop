source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# Core Gems
gem 'bootsnap', '>= 1.1.0', require: false # Reducing boot times
gem 'coffee-rails', '~> 4.2' # CoffeeScript for assets and views
gem 'httparty' # HTTP request library
gem 'jbuilder', '~> 2.5' # JSON APIs
gem 'pg', '>= 0.18', '< 2.0' # PostgreSQL as the database
gem 'puma', '~> 3.11' # App server
gem 'rails', '~> 5.2.6'
gem 'sass-rails', '~> 5.0' # SCSS for stylesheets
gem 'turbolinks', '~> 5' # Faster web navigation
gem 'uglifier', '>= 1.3.0' # JS compressor

# Development & Test group
group :development, :test do
  gem 'capybara'
  gem 'launchy'
  gem 'orderly'
  gem 'pry'
  gem 'pry-nav'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'shoulda-matchers'
  gem 'simplecov'
end

# Development group
group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'spring' # Speed up development
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Platform-specific gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Uncomment below if you want to use them:
# gem 'mini_racer', platforms: :ruby      # For ExecJS
# gem 'redis', '~> 4.0'                   # Redis for Action Cable in production
# gem 'bcrypt', '~> 3.1.7'                # Secure password for ActiveModel
# gem 'mini_magick', '~> 4.8'             # ActiveStorage variant
# gem 'capistrano-rails', group: :development # Deployment with Capistrano
