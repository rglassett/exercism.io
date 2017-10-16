class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(new_data)
    direction = new_data > data ? :right : :left
    build_or_recursively_insert(new_data, direction)
  end

  def each(&block)
    return to_enum unless block_given?

    left.each(&block) if left
    yield data
    right.each(&block) if right
  end

  protected

  attr_writer :left, :right

  def build_or_recursively_insert(new_data, direction)
    if self.public_send(direction)
      self.public_send(direction).insert(new_data)
    else
      self.send("#{direction}=", Bst.new(new_data))
    end
  end
end

module BookKeeping
  VERSION = 1
end
