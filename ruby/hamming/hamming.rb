class Hamming
  def self.compute(left, right)
    if left.length != right.length
      raise ArgumentError, 'cannot compare strands of unequal length'
    end

    0.upto(left.length).select { |index| left[index] != right[index] }.count
  end
end

module BookKeeping
  VERSION = 3
end
