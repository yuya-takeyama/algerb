module Algerb; end
module Algerb::Util
  def file_to_class(file)
    file.split('_').map {|word| word.capitalize }.join('')
  end
end
