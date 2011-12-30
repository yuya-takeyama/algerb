require 'algerb/files'

module Algerb; end

class Algerb::FilesBuilder
  attr_reader :files

  def initialize
    @files = Algerb::Files.new
  end

  def add(path)
    @files.add(Algerb::File.new(path))
  end
end
