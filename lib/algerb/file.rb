require 'algerb/util'

module Algerb; end

class Algerb::File
  include Algerb::Util

  attr_reader :path, :file

  def initialize(path)
    @path = path
    @file = remove_dir(path)
  end
end
