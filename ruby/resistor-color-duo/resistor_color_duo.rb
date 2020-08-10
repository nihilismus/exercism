# frozen_string_literal: true

class ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  def self.value(colors)
    first_color, second_color = colors
    "#{COLORS.index(first_color)}#{COLORS.index(second_color)}".to_i
  end
end
