require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'capybara/rails'
require 'capybara/minitest'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
