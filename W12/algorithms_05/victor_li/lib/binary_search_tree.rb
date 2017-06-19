require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value, tree_node = @root)
    if @root == nil
      @root = BSTNode.new(value)
    elsif value <= tree_node.value
      if tree_node.left == nil
        tree_node.left = BSTNode.new(value, tree_node)
      else
        insert(value, tree_node.left)
      end
    else
      if tree_node.right == nil
        tree_node.right = BSTNode.new(value, tree_node)
      else
        insert(value, tree_node.right)
      end
    end
  end

  def find(value, tree_node = @root)
    if tree_node.value == value
      return tree_node
    elsif value <= tree_node.value
      if tree_node.left == nil
        return nil
      else
        find(value, tree_node.left)
      end
    else
      if tree_node.right == nil
        return nil
      else
        find(value, tree_node.right)
      end
    end
  end

  def delete(value)
    found = find(value, tree_node = @root)
    if found
      if found.left == nil && found.right == nil
        if found == @root
          @root = nil
        elsif found.parent.left == found
          found.parent.left = nil
        elsif found.parent.right == found
          found.parent.right = nil
        end
      elsif found.left && found.right == nil
        if found == @root
          @root = @root.left
        else
          found.parent.left = found.left
          found.left.parent = found.parent
        end
      elsif found.right && found.left == nil
        if found == @root
          @root = @root.right
        else
          found.parent.right = found.right
          found.right.parent = found.parent
        end
      else
        max = maximum(found.left)
        if found.parent.left == found
          found.parent.left = max
        else
          found.parent.right = max
        end
        max.parent.right = max.left
        found.left.parent = max
        found.right.parent = max
        found.left = max.left
        found.right = max.right
        if found == @root
          @root = max
        end
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    if tree_node.right
      maximum(tree_node.right)
    else
      return tree_node
    end
  end

  def depth(tree_node = @root)
    return -1 unless tree_node
    1 + [depth(tree_node.left), depth(tree_node.right)].max
  end

  def is_balanced?(tree_node = @root)
    depth(tree_node.left) == depth(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [] unless tree_node
    arr.concat(in_order_traversal(tree_node.left)) if tree_node.left
    arr << tree_node.value
    arr.concat(in_order_traversal(tree_node.right)) if tree_node.right
    arr
  end

  private
  # optional helper methods go here:

end
