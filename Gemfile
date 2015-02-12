source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# for the gov.uk styling
gem 'govuk_frontend_toolkit', :git => "https://github.com/alphagov/govuk_frontend_toolkit_gem.git", :submodules => true
gem 'govuk_template'

# rest client gem for handling our api requests
gem 'rest-client'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'webmock'
  
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # unit testing via rspec
  gem 'rspec-rails', '~>3.0'

  gem 'pry'

  # Adding SimpleCov to provide coverage of Unit Testing
  gem 'simplecov', :require => false

  # Adding gems to convert unit test coverage and results to be used in Jenkins
  gem 'simplecov-cobertura', '~>1.0.2'
  gem 'rspec_junit_formatter'
  gem 'cucumber-rails', :require => false
  gem 'capybara'
  gem 'vcr'
  gem 'therubyracer', :platforms => :ruby
  gem 'rb-readline', :platforms => :ruby
  gem 'minitest-reporters'
  gem 'minitest-ci'
  gem 'poltergeist'
  gem 'pg' # added to help load the db

end
