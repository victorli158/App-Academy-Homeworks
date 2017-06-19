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
          found.left = found.parent.left
          found.left.parent = found.parent
        end
      elsif found.right && found.left == nil
        if found == @root
          @root = @root.right
        elsif found.parent.right == found
          found.right = found.parent.right
          found.right.parent = found.parent
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

  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end

  private
  # optional helper methods go here:

end
