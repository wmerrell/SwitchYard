source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma'

gem 'webpacker'

# Use Haml for view templates
gem 'haml'
gem 'haml-rails'
# Use SCSS for stylesheets
gem 'sassc'
gem 'sassc-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'duktape'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
gem 'coffee-script-source'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use ActiveModel has_secure_password
gem 'bcrypt'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
# gem 'bootsnap', '>= 1.1.0', require: false

gem 'binding_of_caller'
gem 'cancancan'
gem 'friendly_id'
gem 'high_voltage'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rubocop-rails'
gem 'slim-rails'
# gem 'coverband'

# Use RedCarpet to render Markdown into HTML
gem 'redcarpet'

# Gems I wrote
gem 'cssmenu', path: '../cssmenu'
gem 'ms_lorem', path: '../ms_lorem'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution
  # and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'poltergeist'
end

group :development do
  # Use Annotate to annotate routes and models
  gem 'annotate'
  gem 'haml2slim'
  gem 'html2haml'
  gem 'html2slim'
  # Use seed_dump to export data
  gem 'seed_dump'
  # Access an interactive console on exception pages or by
  # calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'better_errors'
  gem 'pry'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'minitest'
  gem 'rubocop-rspec'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
