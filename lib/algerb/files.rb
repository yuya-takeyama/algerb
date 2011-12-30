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
    if @files.has_key?(file.name)
      file.files.each do |name, _file|
        @files[file.name].files[name] = _file
      end
    else
      @files[file.name] = file
    end
    self
  end

  def ==(another)
    self.name == another.name and self.files == another.files
  end
end
