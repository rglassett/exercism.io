class ETL
  def self.transform(letters_by_score)
    letters_by_score.each_with_object({}) do |(score, letters), score_by_letter|
      letters.each { |letter| score_by_letter[letter.downcase] = score }
    end
  end
end

module BookKeeping
  VERSION = 1
end
