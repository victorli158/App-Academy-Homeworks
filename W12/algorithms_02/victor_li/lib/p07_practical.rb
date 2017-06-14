require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  frequencies = HashMap.new()
  string.split("").each do |char|
    if frequencies.include?(char)
      frequencies[char] += 1
    else
      frequencies[char] = 1
    end
  end
  numbers = []
  frequencies.each do |k, v|
    numbers << v
  end
  expected_result = [1]
  (string.length / 2).times { expected_result.push(2) }
  expected_result == numbers.sort
end
