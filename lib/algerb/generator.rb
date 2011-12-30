require 'algerb/util'
require 'algerb/files'
require 'algerb/files_builder'

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
    builder = Algerb::FilesBuilder.new
    files.each do |file|
      builder.add file
    end
    builder.files.files.sort_by {|name, file| name }.map do |name, file|
      "autoload :#{file_to_class(file.name)}, '#{remove_ext(file.name)}'\n"
    end.join('')
  end
end
