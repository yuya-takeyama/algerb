require 'rubygems'
require 'bundler'
Bundler.setup(:default, :test)

require 'cucumber/rake/task'
Cucumber::Rake::Task.new

require 'rspec/core/rake_task'
desc 'Run RSpec'
RSpec::Core::RakeTask.new do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['--color', '--format nested']
end

desc 'Run tests, both RSpec and Cucumber'
task :test => [:spec, :cucumber]

task :default => :test
