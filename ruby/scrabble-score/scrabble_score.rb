# frozen_string_literal: true

class String
  LETTER_VALUE = {
    a: 1, e: 1, i: 1, o: 1, u: 1, l: 1, n: 1, r: 1, s: 1, t: 1,
    d: 2, g: 2,
    b: 3, c: 3, m: 3, p: 3,
    f: 4, h: 4, v: 4, w: 4, y: 4,
    k: 5,
    j: 8, x: 8,
    q: 10, z: 10
  }.freeze

  def scrabble_score
    downcase.chars.map { |character| LETTER_VALUE[character.to_sym] }.compact.sum
  end
end

class NilClass
  def scrabble_score
    0
  end
end

class Scrabble
  def initialize(string)
    @string = string
  end

  def score
    @string.scrabble_score
  end

  def self.score(string)
    string.scrabble_score
  end
end
