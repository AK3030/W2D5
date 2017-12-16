class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0

    self.each_with_index do |el, idx|
      sum = sum ^ (el.hash + idx).hash
    end

    sum
  end
end

class String
  def hash
    sum = 0

    self.each_char.with_index do |char, idx|
      sum = sum ^ (char.ord + idx).hash
    end

    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0

    self.each do |key, value|
      sum = sum ^ (key.hash + value.hash).hash
    end

    sum
  end
end
