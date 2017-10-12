
require 'benchmark'

## Brute force solution

def two_sum?(arr, target_sum)
  arr.length.times do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

arr = (0..10000).to_a.shuffle
time = Benchmark.measure {
  puts two_sum?(arr, 6) # => should be true
  puts two_sum?(arr, 10) # => should be false
}
puts time.real

def okay_two_sum?(arr, target_sum)
  arr = arr.sort
  while arr.length > 1
    sum = arr[0] + arr[-1]
    return true if sum == target_sum
    if sum > target_sum
      arr.pop
    else
      arr.shift
    end
  end
  false
end

time = Benchmark.measure {
  puts okay_two_sum?(arr, 6) # => should be true
  puts okay_two_sum?(arr, 10) # => should be false
}
puts time.real

def hash_two_sum?(arr, target_sum)
  hash = Hash.new(nil)
  arr.each do |el|
    hash[el] = true
  end
  hash.keys.each do |k|
    return true if hash[target_sum-k]
  end
  false
end

time = Benchmark.measure {
  puts hash_two_sum?(arr, 6) # => should be true
  puts hash_two_sum?(arr, 10) # => should be false
}
puts time.real
