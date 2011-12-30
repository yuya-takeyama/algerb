require 'algerb/file'

module Algerb; end

class Algerb::Files
  include ::Enumerable

  attr_reader :name, :files

  def initialize(name = nil, files = {})
    @name = name
    @files = files
  end

  def add(file)
    @files[file.name] = file
    self
  end

  def ==(another)
    self.name == another.name and self.files == another.files
  end
end
