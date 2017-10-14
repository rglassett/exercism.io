class Trinary
  def initialize(trinary_string)
    @trinary_string = trinary_string
  end

  def to_decimal
    return 0 unless @trinary_string =~ /\A[012]+\z/

    trinary_bit_enumerator = @trinary_string.each_char.reverse_each.with_index

    trinary_bit_enumerator.inject(0) do |decimal_value, (char, index)|
      decimal_value + 3 ** index * Integer(char)
    end
  end
end

module BookKeeping
  VERSION = 1
end
