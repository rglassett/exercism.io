class RunLengthEncoding
  def self.encode(input)
    char_counts = []

    input.scan(/(.)(\1*)/) do |head, tail|
      char_counts << [1 + tail.length, head]
    end

    char_counts.inject('') do |output, (count, char)|
      output + "#{count if count > 1}#{char}"
    end
  end

  def self.decode(input)
    char_counts = input.scan(/(\d*)(.)/)

    char_counts.map! do |(count, char)|
      [count.empty? ? 1 : Integer(count), char]
    end

    char_counts.inject('') { |output, (count, char)| output + char * count }
  end
end

module BookKeeping
  VERSION = 3
end
