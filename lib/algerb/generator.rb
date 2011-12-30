require 'algerb/util'

module Algerb; end
class Algerb::Generator
  include Algerb::Util

  def generate(files)
    files = files.map {|file| file.sub(/\.rb$/, '') }

    result = <<-__E_O_F__
class Autoloader
  def self.register
    Object.module_eval <<-__EOF__
    __E_O_F__

    result += generate_autoloader_body(files).split("\n").map{|line| '      ' + line }.join("\n") + "\n"

    result += <<-__E_O_F__
    __EOF__
  end
end
    __E_O_F__
    result
  end

  def generate_autoloader_body(files)
    files.map do |file|
      "autoload :#{file_to_class(file)}, '#{file}'"
    end.join("\n") + "\n"
  end
end
