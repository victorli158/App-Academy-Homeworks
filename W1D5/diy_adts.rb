class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    mapped = false
    @map.each do |el|
      if el.first == key
        el[1] = value
        mapped = true
      end
    end
    @map << [key, value] unless mapped
    @map
  end

  def lookup(key)
    @map.each do |el|
      return el.last if el.first == key
    end
    nil
  end

  def remove(key)
    @map.each do |el|
      @map.delete(el) if el.first == key
    end
    nil
  end

  def show
    @map
  end
end
