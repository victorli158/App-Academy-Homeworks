require 'byebug'

FISH = [
  'fish',
  'fiiish',
  'fiiiiish',
  'fiiiish',
  'fffish',
  'ffiiiiisshh',
  'fsh',
  'fiiiissshhhhhh'
]

TILES_ARRAY = [
  "up",
  "right-up",
  "right",
  "right-down",
  "down",
  "left-down",
  "left",
  "left-up"
]

FISH_HASH = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def sluggish(arr)
  current_fish = ""
  arr.each_with_index do |el, idx|
    current_fish = el
    remaining_array = arr[0...idx] + arr[idx + 1..-1]
    remaining_array.each do |ele|
      if ele.length > current_fish.length
        current_fish = ele
      end
    end
  end
  current_fish
end

def dominant(arr)
  merge_sort(arr).last
end

def merge_sort(arr)
  return arr if arr.count <= 1
  midpoint = arr.count / 2
  left = merge_sort(arr.take(midpoint))
  right = merge_sort(arr.drop(midpoint))
  merge(left, right)
end

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    case left.first.length <=> right.first.length
    when -1
      merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end
  merged.concat(left)
  merged.concat(right)
  merged
end

def clever(arr)
  longest_fish = ""
  arr.each do |el|
    longest_fish = el if el.length > longest_fish.length
  end
  longest_fish
end

def slow_dance(target, tiles_array)
  tiles_array.each_with_index do |el, idx|
    return idx if el == target
  end
end

def fast_dance(target, new_data_tiles_structure)
  new_data_tiles_structure[target]
end
