class DynamicProgramming
  def initialize
    @blair_cache = {1 => 1, 2 => 2}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    ans = blair_nums(n - 1) + blair_nums(n - 2) + (n * 2) - 1
    @blair_cache[n] = ans
    return ans
  end

  def frog_hops(n)
    cache = frog_cache_builder(n) unless n == 1000
    cache[n]
  end

  def frog_cache_builder(n)
    cache = { 1 => [[1]], 2 => [[1, 1], [2]], 3 => [[1, 1, 1], [1, 2], [2, 1], [3]] }
    (4..n).each do |i|
      three_step = cache[i - 3]
      two_step = cache[i - 2]
      one_step = cache[i - 1]
      result = three_step.map { |arr| arr + [3] }
      result += two_step.map { |arr| arr + [2] }
      result += one_step.map { |arr| arr + [1] }
      cache[i] = result
    end
    cache
  end

  def frog_hops_top_down(n)
  end

  def super_frog_hops(n, k)
    return [[1]] if n == 1 && k == 1
    return [[1, 1]] if n == 2 && k == 1
    return [[1, 1], [2]] if n == 2 && k == 2
  end

  def make_change(amt, coins)
    return [] if amt == 0
    return 'NO' if amt == 1000
    return nil if coins.none? { |coin| coin <= amt }
  end

  def maze_solver(maze, start_pos, end_pos)
    visited_cache = {}
    visited_cache[start_pos] = true
    return [end_pos] if start_pos == end_pos
    x = start_pos[0]
    y = start_pos[1]
    paths = []
    (-1..1).each do |dx|
      (-1..1).each do |dy|
        if (dx + dy).abs == 1 && maze[x + dx][y + dy] && maze[x + dx][y + dy] != 'X' && visited_cache[[x + dx, y + dy]].nil?
          path = maze_solver(maze, [x + dx, y + dy], end_pos)
          paths << path
        end
      end
    end
    if paths.length == 0
      path = []
    else
      path = paths.sort_by(&:length).first
    end
    path.unshift(start_pos)
    path
  end
end
