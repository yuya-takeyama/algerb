class Algerb::File
  include Algerb::Util

  FILE_PATTERN = %r{/?(a-z0-9\-_\.)$}i

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def each(&block)
    each_files(&block)
  end

  def ==(another)
    self.name == another.name
  end
end
