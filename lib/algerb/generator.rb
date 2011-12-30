require 'algerb/util'
require 'algerb/files'

module Algerb; end
class Algerb::Generator
  include Algerb::Util

  def generate(files)
    result = <<-__E_O_F__
class Autoloader
  def self.register
    Object.module_eval <<-__EOF__
    __E_O_F__

    result += indentation(generate_autoloader_body(files), 6)

    result += <<-__E_O_F__
    __EOF__
  end
end
    __E_O_F__
    result
  end

  def generate_autoloader_body(files)
    files = files.inject(Algerb::Files.new) do |files, file|
      files.push(file)
      files
    end

    files.files.map do |file|
      "autoload :#{file_to_class(file.file)}, '#{remove_ext(file.path)}'\n"
    end.join('')
  end
end
