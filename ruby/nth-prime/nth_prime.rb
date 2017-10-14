class Prime
  class IncrementalSieve
    # https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#Incremental_sieve
    #
    # For each prime number n, the classical Sieve of Eratosthenes marks each
    # multiple (m * n) as composite, up to an upper bound. Some work can be
    # saved by starting at (n * n), since all other composite numbers with n as
    # a prime factor will already have been marked from previously-considered
    # primes.
    #
    # In an infinite prime number generator, the set of composite numbers that
    # follow a prime number n is given by the infinite series:
    #
    # ((n * n) + (m * n)) for all positive integer values of m.
    #
    # By computing and marking composite numbers lazily, one at a time, we can
    # remove the upper bound required for the classical sieve, giving us an
    # infinite prime number generator.
    #
    # When the incremental sieve finds a prime number, we record in a hash table
    # that (n * n) is a composite number, with n as its lowest prime factor.
    # When the sieve later encounters this composite number, it lazily finds and
    # records only the next element in the sequence by incrementing m until a
    # new composite number is found.

    attr_accessor :candidate
    attr_reader :prime_factors, :primes

    def initialize
      @candidate = 1
      @prime_factors = {}
      @primes = []
    end

    def next
      self.candidate += 1

      if prime_factors.key?(candidate)
        find_and_record_next_composite(candidate)
      else
        primes << candidate
        prime_factors[candidate ** 2] = candidate
      end
    end

    def find_and_record_next_composite(composite)
      prime_factor = prime_factors[composite]

      composite += prime_factor while prime_factors.key?(composite)

      prime_factors[composite] = prime_factor
    end
  end

  @sieve = IncrementalSieve.new

  def self.nth(n)
    raise ArgumentError, 'there is no zeroth prime' if n == 0
    @sieve.next until @sieve.primes.length >= n
    @sieve.primes[n - 1]
  end
end

module BookKeeping
  VERSION = 1
end
