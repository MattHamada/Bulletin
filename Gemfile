source 'https://rubygems.org'
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'


# Use SCSS for stylesheets
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'font-awesome-rails'

gem 'bcrypt-ruby', '3.1.2'
gem 'faker'
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '3.0.4'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'paperclip'

gem 'breadcrumbs_on_rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  #nicer error page
  gem 'better_errors'
  gem 'binding_of_caller'
  #monitors for database optimizations in development
  gem 'bullet'
  #for viewing emails sent
  gem 'letter_opener'
  #security auditing
  gem 'brakeman', require: false
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '1.3.9'
  gem 'rspec-rails'
  gem 'guard-rspec', '2.5.0' #rspec generation and autotest
  #gem 'ruby-debug19'  #allow ruby debugger
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  #gem 'ZenTest'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'factory_girl_rails', '4.2.0'
  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'cucumber-rails-training-wheels' #premade stepdefs
  gem 'database_cleaner', github: 'bmabey/database_cleaner' #reset cucumber db after test
  gem 'libnotify', '0.8.0'
  gem 'launchy' #debug tool for user stories
  gem 'simplecov', :require => false
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
