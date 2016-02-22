require 'rubygems'
require 'bundler'

Bundler.require

#require config/environment.rb
require File.expand_path('../config/environment', __FILE__)

run Sinatra::Application