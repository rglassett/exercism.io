class Game
  BowlingError = Class.new(StandardError)

  class Frame
    def initialize(next_frame)
      @rolls = []
      @next_frame = next_frame
    end

    def next_rolls(count)
      if next_frame.is_a?(FrameTen)
        next_frame.rolls.take(count)
      else
        (next_frame.rolls + next_frame.next_frame.rolls).take(count)
      end
    end

    def over?
      strike? || spare? || @rolls.length == 2
    end

    def roll(pins)
      validate_roll!(pins)
      raise ArgumentError, "can't roll in a completed frame" if over?
      rolls << pins
    end

    def score
      if strike?
        rolls.sum + next_rolls(2).sum
      elsif spare?
        rolls.sum + next_rolls(1).sum
      else
        rolls.sum
      end
    end

    def spare?
      rolls.sum == 10 && !strike?
    end

    def strike?
      rolls == [10]
    end

    protected

    attr_reader :rolls, :next_frame

    private

    def validate_roll!(pins)
      raise BowlingError if pins < 0 || @rolls.sum + pins > 10
    end
  end

  class FrameTen < Frame
    def initialize
      @rolls = []
    end

    def next_frame
      raise BowlingError, "there is no eleventh frame"
    end

    def over?
      if strike? || spare?
        rolls.length == 3
      else
        rolls.length == 2
      end
    end

    def score
      rolls.sum
    end

    def spare?
      rolls.take(2).sum == 10
    end

    def strike?
      rolls.first == 10
    end

    private

    def validate_roll!(pins)
      rolls_in_play =
        if rolls.first == 10
          rolls.drop_while { |roll| roll == 10 }
        elsif spare?
          []
        else
          rolls
        end

      if pins < 0 || pins > 10 || rolls_in_play.sum + pins > 10
        raise BowlingError
      end
    end
  end

  def initialize
    @current_frame_number = 0
    @frames = [FrameTen.new]
    9.times { @frames.unshift(Frame.new(@frames.first)) }
  end

  def roll(pins)
    if current_frame.over?
      if current_frame.is_a?(FrameTen)
        raise BowlingError
      else
        @current_frame_number += 1
      end
    end

    current_frame.roll(pins)
  end

  def current_frame
    @frames[@current_frame_number]
  end

  def score
    raise BowlingError unless @frames.last.over?
    @frames.map(&:score).sum
  end
end

module BookKeeping
  VERSION = 3
end
