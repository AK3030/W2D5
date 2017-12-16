class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max) { false }
  end

  def insert(num)
    raise "SUH DOO" if num > @max || num < 0
    @store[num % @max] = true
  end

  def remove(num)
    raise "SUHHH mahDOOO" if num > @max
    @store[num % @max] = false
  end

  def include?(num)
    raise 'FUK U MAH DOO' if num > @max
    !!@store[num % @max]
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
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
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
    return if include?(num)
    @count += 1
    resize! if @count > num_buckets
    self[num] << num
  end

  def inspect
    p @store
    p @store.length
  end

  def remove(num)
    return if !include?(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_array = Array.new(num_buckets*2) { Array.new }
    new_size = new_array.length

    @store.each do |bucket|
      bucket.each do |el|
        new_array[el % new_size] << el
      end
    end

    @store = new_array
  end
end
