class Clock
  def self.at(hour, minute)
    new(hour, minute)
  end

  def initialize(hour, minute)
    @hour = (hour + minute / 60) % 24
    @minute = minute % 60
  end

  def to_s
    [
      "0#{hour}"[-2, 2],
      "0#{minute}"[-2, 2]
    ].join(':')
  end

  def +(other)
    raise ArgumentError unless other.is_a?(Integer)
    self.class.new(hour, minute + other)
  end

  def ==(other)
    return super unless other.is_a?(self.class)
    [hour, minute] == [other.hour, other.minute]
  end

  protected

  attr_reader :hour, :minute
end

module BookKeeping
  VERSION = 2
end
