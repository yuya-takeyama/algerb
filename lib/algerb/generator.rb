module Algerb; end
class Algerb::Generator
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

  private
  def file_to_class(file)
    file.split(/_/).map {|word| word.capitalize }.join('')
  end
end
