# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'topological_sort'
require_relative 'graph'

def install_order(arr)
  maximum = -1.0 / 0.0
  arr.each do |tuple|
    maximum = tuple[0] if tuple[0] > maximum
    maximum = tuple[1] if tuple[1] > maximum
  end

 vertices = [maximum]

 (maximum).times do |idx|
    vertices[idx] = Vertex.new(idx + 1)
  end

 arr.each do |tuple|
    id = tuple[0]
    dependency = tuple[1]
    Edge.new(vertices[dependency - 1], vertices[id - 1])
  end

 topological_sort(vertices).map(&:value)
end
