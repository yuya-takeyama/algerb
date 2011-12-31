Given /^I am in "([^"]*)" directory$/ do |dir|
  Dir.chdir(File.realpath(File.dirname(__FILE__) + '/../../' + dir))
end

When /^I execute algerb command$/ do
  @command_result = `#{File.dirname(__FILE__) + '/../../bin/algerb'}`
end
