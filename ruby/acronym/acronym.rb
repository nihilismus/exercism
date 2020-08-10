# frozen_string_literal: true

class Array
  def firsts
    map(&:first)
  end

  def glue
    join('')
  end
end

class String
  def normalize
    gsub('-', ' ')
  end

  def separate
    split(' ')
  end

  def first
    self[0, 1]
  end
end

class Acronym
  def self.abbreviate(name)
    name.normalize.separate.firsts.glue.upcase
  end
end
