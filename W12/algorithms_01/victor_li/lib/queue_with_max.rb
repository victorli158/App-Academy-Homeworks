# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

# we can maintain a reference to the max at any point by iterating over
# our store every time we dequeue. For n enqueue/dequeues this would be O(n^2)

# we can do better. our target time complexity for #max will be O(1) by
# spending O(n) amortized for n enqueue/dequeue operations.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store, :maxstore

  def initialize
    @store = RingBuffer.new()
    @maxstore = RingBuffer.new()
  end

  def enqueue(val)
    @store.push(val)
    if @maxstore.length == 0 || @maxstore[@maxstore.length - 1] < val
      @maxstore = [val]
    else
      @maxstore.push(val)
    end
  end

  def dequeue
    if @store[0] == @maxstore[0]
      @maxstore.shift()
    end
    @store.shift()
  end

  def max
    @maxstore[0]
  end

  def length
    @store.length
  end

end
