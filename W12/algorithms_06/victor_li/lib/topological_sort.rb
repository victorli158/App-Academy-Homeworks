require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  queue = vertices.select { |el| el.in_edges.empty? }
  list = []
  until queue.empty?
    popped = queue.shift
    list << popped
    until popped.out_edges.empty?
      edge = popped.out_edges.last
      if edge.to_vertex.in_edges.length == 1
        queue << edge.to_vertex
      end
      edge.destroy!
    end
    popped.destroy!
  end
  list.length == vertices.length ? list : []
end
