=begin
Given a sorted array consisting of only integers where every element
appears twice except for one element which appears once. Find this
single element that appears only once. Do it in O(logn) time and O(1)
space!
=end

def single_in_sorted(arr)
  mid = arr.length / 2
  if arr[mid] == arr[mid + 1]
    single_in_sorted(arr[0...mid])
  elsif arr[mid] == arr[mid - 1]
    single_in_sorted(arr[mid..-1])
  else
    return arr[mid]
  end
end

array = [0, 0, 1, 1, 2, 3, 3]
