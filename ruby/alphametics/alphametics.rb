class Alphametics
  def self.solve(input)
    new(input).solution
  end

  def initialize(input)
    @input = input
    left, right = input.split('==')
    @addends = left.split('+').map(&:strip)
    @sum = right.strip
  end

  def solution
    working_solution || {}
  end

  private

  attr_reader :addends, :sum

  def all_possible_mappings
    permutations = (0..9).to_a.permutation(unique_symbols.length)

    permutations.each_with_object([]) do |permutation, mappings|
      unique_symbols.length.times do |i|
        mappings << Hash[unique_symbols.rotate(i).zip(permutation)]
      end
    end
  end

  def translate(word, mapping)
    candidate = word.chars.map { |char| mapping.fetch(char) }.join
    raise ArgumentError if candidate.length > 1 && candidate.start_with?('0')
    Integer(candidate)
  end

  def unique_symbols
    @unique_symbols ||= (@addends + [@sum])
      .flat_map { |word| word.split('') }
      .uniq
  end

  def working_solution
    all_possible_mappings.detect do |mapping|
      begin
        numeric_addends = @addends.map { |addend| translate(addend, mapping) }
        numeric_addends.inject(&:+) == translate(@sum, mapping)
      rescue ArgumentError
        next false
      end
    end
  end
end
