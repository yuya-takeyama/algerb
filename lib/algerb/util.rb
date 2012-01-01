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

  def split_dir_and_file(path)
    path.scan(%r{^(?:(.*)/)?([^/]+)$})[0]
  end

  def split_path_as_head_and_tail(path)
    path.split('/', 2)
  end
end
