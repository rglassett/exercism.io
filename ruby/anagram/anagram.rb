class Anagram
  Candidate = Struct.new(:raw, :downcased, :letters)

  def initialize(word)
    @letters = word.downcase.chars.sort
    @original_word = word.downcase
  end

  def match(words)
    candidates = words.map do |word|
      downcased = word.downcase
      Candidate.new(word, downcased, downcased.chars.sort)
    end

    candidates.uniq!(&:downcased)
    candidates.select! do |candidate|
      candidate.downcased != @original_word && candidate.letters == @letters
    end

    candidates.map(&:raw)
  end
end

module BookKeeping
  VERSION = 2
end
