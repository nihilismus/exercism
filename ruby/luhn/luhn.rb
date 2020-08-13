# frozen_string_literal: true

class Array
  def even_indexed_multiplied_by(count)
    each_index.map do |index|
      item = self[index].to_i
      index.even? ? count * item : item
    end
  end

  # :reek:TooManyStatements
  def even_indexed_minus(count)
    each_index.map do |index|
      item = self[index].to_i
      next item unless index.even?

      result = item - count
      if block_given?
        next yield(item) ? result : item
      end

      result
    end
  end
end

class String
  def minimal_length?(size)
    length >= size
  end

  def spaces_removed
    gsub(/\s+/, '')
  end

  def trailing_zero_removed
    result = gsub(/^0/, '')
    if block_given?
      return yield(self) ? result : self
    end

    result
  end

  def contains_just_digits?
    scan(/\D/).empty?
  end

  def complies_luhn?
    return false unless length >= 2

    doubled = chars.even_indexed_multiplied_by(2)
    reduced = doubled.even_indexed_minus(9) { |number| number > 9 }
    (reduced.sum % 10).zero?
   end
end

class Luhn
  def self.valid?(string)
    stripped = string.spaces_removed.trailing_zero_removed { |str| str.length.odd? }
    return false unless stripped.contains_just_digits?

    stripped.complies_luhn?
  end
end
