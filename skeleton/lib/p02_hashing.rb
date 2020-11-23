class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return nil.hash if self.empty?
    self.inject do |accum, ele|
      accum= accum^ele * self.index(ele)
      accum
    end
  end
end

class String
  ALPHA = ("a".."z").to_a
  def hash
    chars = self.chars

    new_chars = chars.map do |char|
      ALPHA.index(char.downcase)
    end

    new_chars.hash 

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    flattened = self.to_a.flatten
    flattened.length.each do |i|
    end
  end
end
