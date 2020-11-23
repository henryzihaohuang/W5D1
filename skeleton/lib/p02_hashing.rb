class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.each do |ele|
      ele.hash
    end
  end
end

class String
  def hash
    chars = self.chars
    chars.each do |char|
      char.hash
    end
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.each do |ele|
      ele.hash
    end
  end
end
