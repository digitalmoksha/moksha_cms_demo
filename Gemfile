source 'https://rubygems.org'

#------------------------------------------------------------------------------

gem 'rails', '4.1.8'
gem "mysql2", ">= 0.3.15"
gem 'jquery-rails'
gem 'jquery-ui-rails'

#--- production gems
# gem 'dm_ruby_extensions',       git: 'git://github.com/digitalmoksha/dm_ruby_extensions.git'
# gem 'admin_theme_londinium',    git: 'ssh://git@github.com/digitalmoksha/admin_theme_londinium.git'
# gem 'dm_core',                  git: 'git://github.com/digitalmoksha/dm_core.git'
# gem 'dm_cms',                   git: 'git://github.com/digitalmoksha/dm_cms.git'
# gem 'dm_admin',                 git: 'ssh://git@github.com/digitalmoksha/dm_admin.git'

#--- run the appropriate 'rake dm_xxxx:install:migrations' if you comment these
# gem 'dm_forum',             git: 'git://github.com/digitalmoksha/dm_forum.git'
# gem 'dm_event',             git: 'git://github.com/digitalmoksha/dm_event.git'
# gem 'dm_newsletter',        git: 'git://github.com/digitalmoksha/dm_newsletter.git'
                                
gem 'preferences',              git: "git://github.com/digitalmoksha/preferences.git"
gem 'themes_for_rails',         git: 'git://github.com/digitalmoksha/themes_for_rails.git'
gem 'rails-bootstrap-helpers',  git: 'git://github.com/digitalmoksha/rails-bootstrap-helpers.git'

#--- personal development gems
gem 'dm_ruby_extensions',   path: '/Users/walkerbl/Sites/In_Development/_github/_moksha_gems/dm_ruby_extensions'
gem 'admin_theme_sbadmin2', path: '/Users/walkerbl/Sites/In_Development/_github/_moksha_gems/admin_theme_sbadmin2'
gem 'dm_core',              path: '/Users/walkerbl/Sites/In_Development/_github/_moksha_gems/dm_core'
gem 'dm_cms',               path: '/Users/walkerbl/Sites/In_Development/_github/_moksha_gems/dm_cms'
gem 'dm_admin',             path: '/Users/walkerbl/Sites/In_Development/_github/_moksha_gems/dm_admin'

gem 'whenever', '~> 0.9.2', require: false

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.1'
gem 'therubyracer', platforms: :ruby

# for global app views, such as Devise views, etc.
gem 'bootstrap-sass', '~> 3.2.0'

# for handling issue where certain images are not references with digests
# https://github.com/rails/sprockets-rails/issues/49
gem "non-stupid-digest-assets"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.1.2'

# To use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',                   group: :development

#------------------------------------------------------------------------------

group :development, :test do
  gem 'capistrano', '~> 3.2.1'
  gem 'capistrano-rails', '~> 1.1.1'
  gem 'byebug'
  gem 'ruby-growl', '~> 4.1'
  gem 'thin'  # use the Thin webserver during development

  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails', '~> 4.4.1'
  
  #--- Better Errors
  gem 'better_errors', '~> 1.1.0'
  gem 'binding_of_caller'
  
  #--- Rails Panel
  gem 'meta_request'    # make sure network you run on is secure

  gem 'quiet_assets'    # remove some asset pipeline noise from dev log
end

group :test do
  gem 'sqlite3'
  gem 'faker', '~> 1.4.3'
  gem 'capybara', '~> 2.4.3'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'launchy', '~> 2.4.2'
  gem 'selenium-webdriver', '~> 2.43.0'
  gem 'rspec-formatter-webkit'
  gem 'syntax'
end
