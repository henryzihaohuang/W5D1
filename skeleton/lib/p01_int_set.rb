class MaxIntSet
  attr_reader :store, :max

  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    if !self.include?(num) 
      @store[num] = true
    end
    
    if !(0..max).include?(num) 
      raise "Out of bounds"
    end
    true
  end

  def remove(num)
    if @store[num] == true
      @store[num] = false
    end
  end

  def include?(num)
    @store[num]
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
    if !self[num].include?(num)
      self[num] << num
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num) ? true : false
  end

  private

  def [](num)
    num = num % num_buckets
    #optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if include?(num)
      return false
    else
      self[num] << num
    end

    @count += 1
    resize! if count == num_buckets 
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num) ? true : false
  end

  private

  def [](num)
    num = num % num_buckets
    #optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store= Array.new(2 * num_buckets) { Array.new } 

    (0...@store.length).each do |subarray|
      @store[subarray].each do |i|
        new_store[i] << i
      end
    end
    @store = new_store
  end
end
