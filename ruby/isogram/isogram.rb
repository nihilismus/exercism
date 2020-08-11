# frozen_string_literal: true

class String
  ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z].freeze

  def with_repeated_letter?
    characters = downcase.chars.to_a
    counts = ALPHABET.map { |character| characters.count character }
    counts.select { |count| count > 1 }.sum.positive?
  end
end

class Isogram
  def self.isogram?(string)
    !string.with_repeated_letter?
  end
end
