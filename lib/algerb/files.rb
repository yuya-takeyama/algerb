class Algerb::Files
  include ::Enumerable
  include Algerb::Util

  attr_reader :name, :files

  def initialize(name = nil, files = {})
    @name = name
    @files = files
  end

  def self.root(files = {})
    new(nil, files)
  end

  def add(file)
    @files[file.name] = file unless @files.has_key?(file.name)
    self
  end

  def find_by_path(path)
    next_path, rest = split_path_as_head_and_tail(path)
    if files.has_key?(next_path)
      found = files[next_path]
      if rest.nil?
        found
      elsif found.is_a?(Algerb::Files)
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
