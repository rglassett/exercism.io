require 'set'

class Pangram
  ALPHABET = Set.new('a'..'z')

  def self.pangram?(phrase)
    phrase.downcase.each_char.to_set >= ALPHABET
  end
end

module BookKeeping
  VERSION = 5
end
