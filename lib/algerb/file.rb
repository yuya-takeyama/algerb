class Algerb::File
  include Algerb::Util

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(another)
    name == another.name
  end
end
