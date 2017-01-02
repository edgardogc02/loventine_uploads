source 'https://rubygems.org'

ruby '2.3.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use unicorn as the app server
gem 'unicorn'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# image manipulation
gem 'rmagick'
# handles upload and file saving
gem 'carrierwave'

# Adds cors headers (needed for ajax requests)
gem 'rack-cors', require: 'rack/cors'

# Use for enum. See thumb class
gem 'degu'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  gem 'pry-nav'
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.

  gem 'brakeman', require: false
  gem 'rubocop', require: false
  gem 'rubycritic', require: false
  gem 'sandi_meter'

  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'bundler-audit'

  gem 'capistrano'
  gem 'capistrano-rails'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'guard-rspec'
  gem 'poltergeist'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  # brings back render_template and other functionalities into controller specs
  gem 'rails-controller-testing'
end
