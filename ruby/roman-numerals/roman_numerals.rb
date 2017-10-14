module RomanNumerals
  DENOMINATIONS = {
    1000 => 'M',
    900  => 'CM',
    500  => 'D',
    400  => 'CD',
    100  => 'C',
    90   => 'XC',
    50   => 'L',
    40   => 'XL',
    10   => 'X',
    9    => 'IX',
    5    => 'V',
    4    => 'IV',
    1    => 'I'
  }

  def to_roman
    working_value = self

    DENOMINATIONS.each_with_object('') do |(value, symbol), string|
      next unless working_value >= value

      multiples, remainder = working_value.divmod(value)
      string << symbol * multiples
      working_value = remainder
    end
  end
end

Integer.include RomanNumerals

module BookKeeping
  VERSION = 2
end
