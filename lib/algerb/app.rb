require 'algerb/generator'
require 'thor'

module Algerb; end
class Algerb::App < Thor
  default_task :generate

  method_option :target, :default => './lib'

  desc 'generate', 'Generates autoloader script'
  def generate
    puts ::Algerb::Generator.new.generate(target_files(options['target']))
  end

  private
  def target_files(target_dir)
    original_dir = Dir.pwd
    Dir.chdir(target_dir)
    result = Dir.glob('**/*.rb')
    Dir.chdir(original_dir)
    result.sort
  end
end
