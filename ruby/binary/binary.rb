class Binary
  def self.to_decimal(string)
    raise ArgumentError unless string =~ /\A[01]+\z/

    string.each_char.reverse_each.with_index.inject(0) do |result, (chr, index)|
      result + (2 ** index) * Integer(chr)
    end
  end
end

module BookKeeping
  VERSION = 3
end
