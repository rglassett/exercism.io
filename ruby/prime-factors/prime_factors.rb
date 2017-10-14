class PrimeFactors
  def self.for(number)
    prime_factors = []
    candidate = 2

    until number == 1
      if number % candidate == 0
        prime_factors << candidate
        number /= candidate
      else
        candidate += 1
      end
    end

    prime_factors
  end
end
