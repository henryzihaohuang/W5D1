class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def include?(key)
    self[key].include?(key)
  end
  
  def insert(key)
    return false if self[key].include?(key)
    self[key] << key
    @count += 1
    resize! if count >= num_buckets
  end


  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    num = num.hash % num_buckets
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
