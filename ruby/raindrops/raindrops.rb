# frozen_string_literal: true

# Based on: https://refactoring.guru/design-patterns/chain-of-responsibility/ruby/example

class Integer
  def factors()
    (1..self).select { |number| (self % number).zero? }
  end

  def factor?(number)
    number.factors.include? self
  end
end

class Handler
  def next_handler=(handler)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def handle(request)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class AbstractHandler < Handler
  attr_writer :next_handler

  def next_handler(handler)
    @next_handler = handler
    handler
  end

  def handle(request)
    return @next_handler.handle(request) if @next_handler

    nil
  end
end

class Pling < AbstractHandler
  def handle(number)
    (3.factor?(number) ? 'Pling' : '') + super(number)
  end
end

class Plang < AbstractHandler
  def handle(number)
    (5.factor?(number) ? 'Plang' : '') + super(number)
  end
end

class Plong < AbstractHandler
  def handle(number)
    (7.factor?(number) ? 'Plong' : '') + super(number)
  end
end

class Plzng < AbstractHandler
  def handle(number)
    return number.to_s unless 3.factor?(number) || 5.factor?(number) || 7.factor?(number)

    ''
  end
end

class Raindrops
  def self.convert(number)
    pling = Pling.new
    plang = Plang.new
    plong = Plong.new
    plzng = Plzng.new

    pling.next_handler(plang).next_handler(plong).next_handler(plzng)
    pling.handle(number)
  end
end
