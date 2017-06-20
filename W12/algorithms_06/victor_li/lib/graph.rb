class Vertex
  attr_accessor :value, :in_edges, :out_edges

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end

  def destroy!
    in_edges.each do |edge|
      other_node = edge.from_vertex
      other_node.out_edges.delete(self)
    end
    out_edges.each do |edge|
      other_node = edge.to_vertex
      other_node.in_edges.delete(self)
    end
  end
end

class Edge
  attr_accessor :from_vertex, :to_vertex, :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost
    @from_vertex.out_edges << self
    @to_vertex.in_edges << self
  end

  def destroy!
    @from_vertex.out_edges.delete(self)
    @to_vertex.in_edges.delete(self)
    @from_vertex = nil
    @to_vertex = nil
  end
end
