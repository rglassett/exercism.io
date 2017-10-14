class BeerSong
  def verse(number)
    <<-TEXT
#{bottles(number).capitalize} of beer on the wall, #{bottles(number)} of beer.
#{take_down(number)}, #{bottles(number - 1)} of beer on the wall.
    TEXT
  end

  def verses(first, last)
    first.downto(last).map { |number| verse(number) }.join("\n")
  end

  private

  def bottles(number)
    case number
    when 1
      '1 bottle'
    when 0
      'no more bottles'
    when -1
      '99 bottles'
    else
      "#{number} bottles"
    end
  end

  def take_down(number)
    case number
    when 1
      'Take it down and pass it around'
    when 0
      'Go to the store and buy some more'
    else
      'Take one down and pass it around'
    end
  end
end

module BookKeeping
  VERSION = 3
end
