class Series
  def initialize(string)
    @string = string
  end

  def slices(slice_length)
    raise ArgumentError if slice_length > @string.length

    0.upto(@string.length - slice_length).map do |slice_start|
      slice_end = slice_start + slice_length
      @string[slice_start...slice_end]
    end
  end
end
