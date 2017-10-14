class Phrase
  SIMPLE_WORD = /\w+/
  ABBREVIATED_WORD = /\w+'\w+/
  WORD = /(#{ABBREVIATED_WORD}|#{SIMPLE_WORD})/

  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words.each_with_object(Hash.new(0)) do |word, counts|
      counts[word] += 1
    end
  end

  def words
    phrase.scan(WORD).map { |matches| matches.first.downcase }
  end
end

module BookKeeping
  VERSION = 1
end
