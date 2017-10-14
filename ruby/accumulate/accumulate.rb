module Accumulation
  def accumulate
    return to_enum unless block_given?
    [].tap do |accumulator|
      each { |el| accumulator << yield(el) }
    end
  end
end

Array.include(Accumulation)

module BookKeeping
  VERSION = 1
end
