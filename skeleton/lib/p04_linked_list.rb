require "byebug"
class Node

  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @length = 0
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @length == 0
  end

  def get(key)

  end

  def include?(key)
  end

  def append(key, val)
    @length+=1
    node = Node.new(key, val)
    if @length == 1
      @head.next = node
      @tail.prev = node
    else
      @tail.prev.next = node
      @tail.prev = node
    end

  end

  def update(key, val)


  end

  def remove(key)
  end

  def each(&prc)
    current_node = @head
    prc ||= proc { |current_node, value| current_node }
    i = 0

    while i < @length
      current_node = current_node.next
      prc.call(current_node)
      i += 1
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

# a = Node.new(5, 7)
list = LinkedList.new

list.append(:first, 1)
# list.update(:second, 2)
list.append(:third, 3)
# debugger
list.each_with_index {|el, i| p el}
