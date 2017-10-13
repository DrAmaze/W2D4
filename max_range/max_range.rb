require 'benchmark'


def windowed_max_range(array, w)
  current_max_range = nil
  (0..(array.length - w)).each do |i|
    range = array[i...i+w].max - array[i...i+w].min
    current_max_range = range if !current_max_range || range > current_max_range
  end
  p current_max_range
end

time = Benchmark.measure {
p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6
p windowed_max_range((0...100000).to_a, 3)
}
puts time.real
