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
    _generate_autoloader_body(builder.files.files)
  end

  private
  def _generate_autoloader_body(files, parent = nil, level = 0)
    files.sort_by {|name, file| name }.inject('') do |result, key_value|
      name, file = key_value
      path = remove_ext(prefix(parent) + file.name)
      if file.is_a?(Algerb::File)
        result += indent(level) + "autoload :#{file_to_class(file.name)}, '#{path}'\n"
      else
        result += indent(level) + "module #{file_to_class(file.name)}\n"
        result += _generate_autoloader_body(file.files, path, level + 1)
        result += indent(level) + "end\n"
      end
      result
    end
  end

  def prefix(parent)
    if parent.nil?
      ''
    else
      "#{parent}/"
    end
  end

  def indent(level)
    '  ' * level
  end
end
