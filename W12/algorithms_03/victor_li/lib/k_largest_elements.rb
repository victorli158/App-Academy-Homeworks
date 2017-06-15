require_relative 'heap'
require_relative 'heap_sort'

def k_largest_elements(array, k)
  heap = BinaryMinHeap.new()
  array.each do |el|
    heap.store.push(el)
  end
  heap.store.heap_sort!
  largest = []
  counter = -1
  until largest.length == k
    largest << heap.store[counter]
    counter -= 1
  end
  largest
end
