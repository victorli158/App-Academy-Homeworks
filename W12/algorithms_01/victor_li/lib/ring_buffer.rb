require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
    @start_idx = 0
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index >= @length
    @store[(start_idx + index) % capacity]
  end

  # O(1)
  def []=(index, val)
    raise "index out of bounds" if index >= @length
    @store[(start_idx + index) % capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    last_el = self[length - 1]
    @length -= 1
    last_el
  end

  # O(1) ammortized
  def push(val)
    self.resize! if @length == @capacity
    @length += 1
    self[length - 1] = val
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0
    val = self[0]
    @start_idx = (start_idx + 1) % capacity
    @length -= 1
    val
  end

  # O(1) ammortized
  def unshift(val)
    self.resize! if @length == @capacity
    @start_idx = (start_idx - 1) % capacity
    @length += 1
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    new_capacity = @capacity * 2
    new_store = StaticArray.new(new_capacity)
    length.times do |idx|
      new_store[idx] = self[idx]
    end
    @capacity = new_capacity
    @store = new_store
    @start_idx = 0
  end

end
