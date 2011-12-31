require 'thor'

class Algerb::App < Thor
  default_task :generate

  method_option :target, :default => './lib'
  method_option :output, :default => './autoloader.rb'

  desc 'generate', 'Generates autoloader script'
  def generate
    open(options[:output], 'w') do |file|
      file.puts ::Algerb::Generator.new.generate(target_files(options['target']))
    end
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
