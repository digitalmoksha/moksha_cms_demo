source 'https://rubygems.org'

#------------------------------------------------------------------------------

gem 'rails', '4.2.7.1'
gem 'mysql2', '~> 0.3.18'
gem 'jquery-rails'
gem 'jquery-ui-rails'

#--- production gems
gem 'moksha_cms',            git: 'https://github.com/digitalmoksha/moksha_cms.git',  branch: '4-2-stable'
gem 'themes_for_rails',      git: 'https://github.com/digitalmoksha/themes_for_rails.git'

# gem 'rails-bootstrap-helpers',  git: 'git://github.com/digitalmoksha/rails-bootstrap-helpers.git'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.1'
gem 'therubyracer', platforms: :ruby
gem 'jbuilder', '~> 2.4'
gem 'bcrypt', '~> 3.1.7'

# for global app views, such as Devise views, etc.
gem 'bootstrap-sass', '~> 3.2.0'

# for handling issue where certain images are not referenced with digests
# https://github.com/rails/sprockets-rails/issues/49
gem "non-stupid-digest-assets"

gem 'whenever', '~> 0.9.2', require: false

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

#------------------------------------------------------------------------------

group :development do
  gem 'better_errors', '~> 2.1'
  gem 'binding_of_caller'
  gem 'meta_request'    # Rails Panel: make sure network you run on is secure
  gem 'web-console', '~> 2.0' # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'tuttle'
end

group :development, :test do
  gem 'byebug'

  gem 'mocha', '~> 1.1.0', require: false
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails', '~> 4.5'
  
  gem 'quiet_assets'    # remove some asset pipeline noise from dev log
  gem 'progress_bar', :require => false
end

group :test do
  gem 'sqlite3'
  gem 'faker', '~> 1.6'
  gem 'capybara', '~> 2.6'
  gem 'database_cleaner', '~> 1.5'
  gem 'launchy', '~> 2.4.3'
  gem 'selenium-webdriver', '~> 2.50.0'
  gem 'rspec-formatter-webkit'
  gem 'syntax'
end
