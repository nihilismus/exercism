# frozen_string_literal: true

class Array
  def maximum
    max
  end

  def last_is_maximum?
    last == maximum
  end

  def maximums(count = 1)
    sort.reverse[0, count]
  end
end

class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    @scores.last
  end

  def personal_best
    @scores.maximum
  end

  def personal_top_three
    @scores.maximums 3
  end

  def latest_is_personal_best?
    @scores.last_is_maximum?
  end
end
