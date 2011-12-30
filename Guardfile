# A sample Guardfile
# More info at https://github.com/guard/guard#readme

group :feature do
  guard 'cucumber' do
    watch(%r{^features/.+\.feature$})
    watch(%r{^features/support/.+$})          { 'features' }
    watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
    watch(%r{^bin/algerb$}) { 'features' }
  end
end

group :spec do
  guard 'rspec', :version => 2 do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/unit/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { "spec" }
  end
end
