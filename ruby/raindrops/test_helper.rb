require 'minitest/autorun'
require "minitest/reporters"

module Minitest
  class Test
    def skip(_msg='', _bt=caller)
    end
  end
end

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]
