source 'https://rubygems.org'

ruby '2.2.2'

# Rails default gems
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use postgresql instead
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# https://github.com/gemgento/rails_script
gem 'rails_script', '~> 0.6.1'

# to support https://github.com/blowmage/minitest-rails-capybara
gem 'minitest-rails'

# asynchronous processes
gem 'sidekiq'

# authentication
gem 'devise'

# authorization
gem 'pundit'

group :production do
  # Use Unicorn as the app server
  gem 'unicorn'
  # Include 'rails_12factor' gem to enable all platform features
  # See https://devcenter.heroku.com/articles/rails-integration-gems
  gem 'rails_12factor'
end

  
  

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  #   console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the
  #   background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development do
  gem 'puma'
  gem 'pry'
end

group :test do
  # from pfox
  gem 'simplecov', :require => false
  # from https://github.com/codeclimate/ruby-test-reporter
  gem 'codeclimate-test-reporter'
  # from https://github.com/blowmage/minitest-rails-capybara
  gem 'minitest-rails-capybara'
  # from https://github.com/wojtekmach/minitest-metadata
  gem 'minitest-metadata', require: false
  gem 'selenium-webdriver'
  # http://chriskottom.com/blog/2014/06/dress-up-your-minitest-output/
  gem 'minitest-reporters'
end
