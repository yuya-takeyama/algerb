require 'algerb/util'

module Algerb; end
class Algerb::Generator
  include Algerb::Util

  def initialize(files)
    @files = files.map {|file| file.sub(/\.rb$/, '') }
  end

  def generate
    result = <<-__E_O_F__
class Autoloader
  def self.register
    Object.module_eval <<-__EOF__
    __E_O_F__
    result += @files.map do |file|
      "      autoload :#{file_to_class(file)}, '#{file}'"
    end.join("\n") + "\n"
    result += <<-__E_O_F__
    __EOF__
  end
end
    __E_O_F__
    result
  end
end
