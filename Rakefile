require 'rubygems'
require 'bundler'
Bundler.setup(:default, :development)
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name        = 'algerb'
  gem.homepage    = "http://github.com/yuya-takeyama/algerb"
  gem.license     = 'MIT'
  gem.summary     = %Q{Autoloader generator for Ruby}
  gem.description = %Q{Generates autoloader script for your Ruby library.}
  gem.email       = 'sign.of.the.wolf.pentagram@gmail.com'
  gem.authors     = ['Yuya Takeyama']
end
Jeweler::RubygemsDotOrgTasks.new

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features)

require 'rspec/core/rake_task'
desc 'Run RSpec'
RSpec::Core::RakeTask.new do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['--color', '--format nested']
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'spec'
  test.pattern = 'spec/**/*_spec.rb'
  test.verbose = true
end

desc 'Run tests, both RSpec and Cucumber'
task :test => [:spec, :features]

task :default => :test

require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "algerb #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
