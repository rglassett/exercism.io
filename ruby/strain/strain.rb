module Strain
  def keep
    each_with_object([]) do |el, kept|
      kept << el if yield el
    end
  end

  def discard
    each_with_object([]) do |el, kept|
      kept << el unless yield el
    end
  end
end

Array.include(Strain)
