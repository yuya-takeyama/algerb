require 'algerb/file'

module Algerb; end

class Algerb::Files
  def initialize(files = [])
    @files = files
  end

  def push(file)
    @files << Algerb::File.new(file)
  end

  def files
    @files.sort_by {|file| file.path }
  end
end
