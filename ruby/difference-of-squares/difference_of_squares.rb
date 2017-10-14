class Squares
  attr_reader :n

  def initialize(n)
    @n = n
  end

  def square_of_sum
    1.upto(n).sum ** 2
  end

  def sum_of_squares
    1.upto(n).sum { |x| x ** 2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 4
end
