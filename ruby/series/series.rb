# frozen_string_literal: true

class String
  def enough_length?(size)
    size.positive? && size <= length
  end

  def slices(size)
    raise ArgumentError, '' unless enough_length? size

    chars.each_cons(size).map(&:join)
  end
end

class Series
  def initialize(string)
    @string = string
  end

  def slices(length)
    @string.slices length
  end
end
