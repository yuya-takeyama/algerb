$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'bundler'
Bundler.setup(:default, :development)
require 'rspec'
require File.realpath(File.dirname(__FILE__)) + '/../autoloader.rb'
