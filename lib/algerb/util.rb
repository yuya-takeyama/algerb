module Algerb; end
module Algerb::Util
  def file_to_class(file)
    remove_ext(file).split('_').map {|word| word.capitalize }.join('')
  end

  def indentation(code, level)
    code.split("\n").map {|line| ' ' * level + line + "\n" }.join('')
  end

  def remove_dir(path)
    path.sub(%r{^([a-z0-9\_]*/)*}, '')
  end

  def remove_ext(path)
    path.sub(/\.rb$/, '')
  end
end
