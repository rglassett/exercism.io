require 'set'

class Sieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def primes
    @sieve ||= build_sieve

    2.upto(limit).reject { |number| @sieve.include?(number) }
  end

  def build_sieve
    sieve = Set.new

    2.upto(limit).each do |number|
      multiple = 2 * number

      until multiple > limit
        sieve << multiple
        multiple += number
      end
    end

    sieve
  end
end

module BookKeeping
  VERSION = 1
end
