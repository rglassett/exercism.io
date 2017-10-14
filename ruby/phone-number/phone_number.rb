class PhoneNumber
  VALID_AREA_EXCHANGE_CODES = /^[2-9]\d{2}$/

  def self.clean(string)
    new(string).clean
  end

  def initialize(string)
    @number = string.gsub(/[^\d]/, '')
    @country_code = @number[-11] || '1'
    @area_code = @number[-10..-8]
    @exchange_code = @number[-7..-5]
    @subscriber_number = @number[-4..-1]
  end

  def clean
    return nil unless [10, 11].include?(@number.length) &&
      @country_code == '1' &&
      @area_code =~ VALID_AREA_EXCHANGE_CODES &&
      @exchange_code =~ VALID_AREA_EXCHANGE_CODES

    @number[-10..-1]
  end
end

module BookKeeping
  VERSION = 2
end
