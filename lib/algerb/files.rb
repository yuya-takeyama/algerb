class Algerb::Files
  include ::Enumerable

  attr_reader :name, :files

  def initialize(name = nil, files = {})
    @name = name
    @files = files
  end

  def self.root(files = {})
    new(nil, files)
  end

  def add(file)
    if @files.has_key?(file.name)
      file.files.each do |name, _file|
        @files[file.name].files[name] = _file
      end
    else
      @files[file.name] = file
    end
    self
  end

  def find_by_path(path)
    next_path, rest = path.split('/', 2)
    if files.has_key?(next_path)
      found = files[next_path]
      if found.is_a?(Algerb::Files)
        found.find_by_path(rest)
      else
        found
      end
    end
  end

  def ==(another)
    self.name == another.name and self.files == another.files
  end
end
