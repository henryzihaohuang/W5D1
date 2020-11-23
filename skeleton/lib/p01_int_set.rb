class MaxIntSet
  attr_reader :max

  def initialize(max)
    @store = Set.new
    @max = max
  end

  def insert(num)
    if !self.include?(num) 
      @store << num
    elsif num > max
      raise "Out of bounds"
    end
  end

  def remove(num)
    if self.include?(num) 
      @store.delete(num)
    end

  end

  def include?(num)
    @store.include?(num) ? true : false
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
