class Algerb::FilesBuilder
  include Algerb::Util

  attr_reader :files

  FILE_PATTERN = %r{^([a-z0-9\_\.])/?}

  def initialize
    @files = Algerb::Files.new
  end

  def add(path)
    paths = path.split('/').reverse
    file = Algerb::File.new(paths.slice!(0, 1)[0])
    files = paths.inject(file) do |file, path|
      files = Algerb::Files.new(path).add(file)
      files
    end
    @files.add files
    self
  end

  def mkdir_p(path)
    dir, rest = split_path_as_head_and_tail(path)
    files.add(Algerb::Files.new(dir))
  end
end
