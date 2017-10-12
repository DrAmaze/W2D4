
#Minimum fuctions

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min(list)
  list.each do |e|
    min_number = true
    list.each do |e2|
      min_number = false if e2 < e
    end
    return e if min_number
  end
end

puts my_min(list)

def my_min_not_stupid(list)
  min = nil
  list.each do |e|
    min = e if !min || e < min
  end
  min
end

puts my_min_not_stupid(list)


#Largest Contiguous Sub-sum

list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]

def largest_contiguous_subsum(list)
  sub_arrays = []
  (0...list.length).each do |i|
    (i+1...list.length).each do |j|
      sub_arrays << list[i..j]
    end
  end
  sub_arrays.max { |a, b| a.reduce(:+) <=> b.reduce(:+) }
end

print "#{list1}: "
puts largest_contiguous_subsum(list1)
print "#{list2}: "
puts largest_contiguous_subsum(list2)
print "#{list3}: "
puts largest_contiguous_subsum(list3)

def largest_contiguous_subsum_less_stupid(list)
  largest_subsum = 0
  current_sum = 0
  largest_el = nil

  list.each do |e|
    current_sum += e
    current_sum = 0 if current_sum < 0
    largest_el = e if !largest_el || e > largest_el
    largest_subsum = current_sum if current_sum > largest_subsum
  end
  
  return largest_el if largest_el < largest_subsum
  largest_subsum
end

print "#{list1}: "
puts largest_contiguous_subsum_less_stupid(list1)
print "#{list2}: "
puts largest_contiguous_subsum_less_stupid(list2)
print "#{list3}: "
puts largest_contiguous_subsum_less_stupid(list3)
