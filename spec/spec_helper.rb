$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'bundler'
Bundler.setup(:default, :test)
require 'rspec'
