class SpaceAge
  SECONDS_IN_EARTH_YEAR = 31_557_600
  RELATIVE_YEAR_DURATIONS = {
    'mercury' => 0.2408467,
    'venus' => 0.61519726,
    'mars' => 1.8808158,
    'jupiter' => 11.862615,
    'saturn' => 29.447498,
    'uranus' => 84.016846,
    'neptune' => 164.79132
  }

  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    seconds.fdiv(SECONDS_IN_EARTH_YEAR)
  end

  def method_missing(name, *args)
    match_data = name.match(/\Aon_(?<planet>\w+)\z/)
    return super unless match_data
    on_earth.fdiv(RELATIVE_YEAR_DURATIONS.fetch(match_data['planet']))
  end
end

module BookKeeping
  VERSION = 1
end
