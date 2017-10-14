require 'set'

class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(upper_bound)
    factors.each_with_object(Set.new) do |factor, multiples|
      (factor...upper_bound).step(factor) do |multiple|
        multiples << multiple
      end
    end.sum
  end

  private

  attr_reader :factors
end

module BookKeeping
  VERSION = 1
end
