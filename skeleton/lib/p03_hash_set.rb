require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    @count += 1
    resize! if @count > num_buckets
    self[key] << key
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    return nil if !include?(key)
    self[key].delete(key)
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_array = Array.new(num_buckets * 2) {Array.new}
    temp_size = num_buckets * 2

    @store.each do |bucket|
      bucket.each do |el|
        temp_array[el.hash % temp_size] << el
      end
    end

    @store = temp_array
  end
end
