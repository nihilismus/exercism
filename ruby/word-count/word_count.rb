# frozen_string_literal: true

class Array
  def frequency
    group_by(&:itself).each_with_object({}) do |(string, array), hash|
      hash[string] = array.length
    end
  end
end

class String
  def words
    delete("^a-zA-Z0-9', ").strip.split(/[\s,]+/).map(&:unquote)
  end

  def unquote
    sub(/^'/, '').sub(/'$/, '')
  end
end

class Phrase
  def initialize(string)
    @string = string
  end

  def word_count
    @string.downcase.words.frequency
  end
end
