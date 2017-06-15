require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
  end

  def count
    @store.length
  end

  def extract
    extracted = @store[0]
    if count > 1
      @store[0] = @store.pop
      BinaryMinHeap.heapify_down(@store, 0, &prc)
    else
      @store.pop
    end
    extracted
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(@store, count - 1, &prc)
  end

  public
  def self.child_indices(len, parent_index)
    indices = []
    first_idx = parent_index * 2 + 1
    second_idx = parent_index * 2 + 2
    indices << first_idx if first_idx < len
    indices << second_idx if second_idx < len
    indices
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    return (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    left_idx, right_idx = BinaryMinHeap.child_indices(len, parent_idx)
    parent_val = array[parent_idx]
    children = []
    children << array[left_idx] if left_idx
    children << array[right_idx] if right_idx
    if children.all? { |child| prc.call(parent_val, child) <= 0 }
      return array
    end
    smaller = nil
    if children.length == 1
      smaller = left_idx
    else
      smaller = prc.call(children[0], children[1]) == -1 ? left_idx : right_idx
    end
    array[parent_idx], array[smaller] = array[smaller], parent_val
    BinaryMinHeap.heapify_down(array, smaller, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    return array if child_idx.zero?
    parent_idx = BinaryMinHeap.parent_index(child_idx)
    child_val, parent_val = array[child_idx], array[parent_idx]
    if prc.call(child_val, parent_val) >= 0
      return array
    else
      array[child_idx], array[parent_idx] = parent_val, child_val
      BinaryMinHeap.heapify_up(array, parent_idx, len, &prc)
    end
  end
end
