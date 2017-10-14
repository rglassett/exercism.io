class Raindrops
  def self.convert(number)
    pling_plang_plong = ''
    pling_plang_plong << 'Pling' if number % 3 == 0
    pling_plang_plong << 'Plang' if number % 5 == 0
    pling_plang_plong << 'Plong' if number % 7 == 0

    if pling_plang_plong.empty?
      number.to_s
    else
      pling_plang_plong
    end
  end
end

module BookKeeping
  VERSION = 3
end
