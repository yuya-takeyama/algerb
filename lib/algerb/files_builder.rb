class Algerb::FilesBuilder
  include Algerb::Util

  attr_reader :files

  def initialize
    @files = Algerb::Files.new
  end

  def add(path)
    dir, file = split_dir_and_file(path)
    if dir
      mkdir_p(dir)
      files.find_by_path(dir).add(Algerb::File.new(file))
    else
      files.add(Algerb::File.new(file))
    end
    self
  end

  def mkdir_p(path)
    target = files
    while path
      dir, path = split_path_as_head_and_tail(path)
      target.add(Algerb::Files.new(dir))
      target = target.find_by_path(dir)
    end
  end
end
