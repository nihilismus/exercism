# frozen_string_literal: true

class String
  def differences(string)
    larger_index = [length, string.length].max - 1
    (0..larger_index).reduce(0) do |total, index|
      string[index] != self[index] ? total.next : total
    end
  end
end

class Hamming
  def self.compute(first_dna_strand, second_dna_strand)
    raise ArgumentError, '' unless first_dna_strand.length == second_dna_strand.length

    first_dna_strand.differences second_dna_strand
  end
end
