require 'benchmark'

class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(item)
    cur_min = min
    cur_max = max
    cur_min = item if !cur_min || item < cur_min
    cur_max = item if !cur_max || item > cur_max
    @store.push([item, cur_min, cur_max])
  end

  def min
    return nil if size == 0
    peek[1]
  end

  def max
    return nil if size == 0
    peek[2]
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end


class StackQueue

  def initialize
    @inbox = MyStack.new
    @outbox = MyStack.new
  end

  def enqueue(item)
    @inbox.push(item)
  end

  def dequeue
    return @outbox.pop if !@outbox.empty?
    until @inbox.empty?
      @outbox.push(@inbox.pop[0])
    end
    @outbox.pop
  end

  def max
    return @outbox.max if @inbox.empty?
    return @inbox.max if @outbox.empty?
    [@outbox.max, @inbox.max].max
  end

  def min
    return @outbox.min if @inbox.empty?
    return @inbox.min if @outbox.empty?
    [@outbox.min, @inbox.min].min
  end

  def size
    @inbox.size + @outbox.size
  end

  def empty?
    @inbox.empty? && @outbox.empty?
  end

end

def optimized_windows(array, w)
  current_max_range = nil
  stack = StackQueue.new
  (0...array.length).each do |i|
    stack.enqueue(array[i])
    if stack.size == w
      range = stack.max - stack.min
      current_max_range = range if !current_max_range || range > current_max_range
      stack.dequeue
    end
  end

  current_max_range
end

time = Benchmark.measure {
  puts optimized_windows([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
  puts optimized_windows([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
  puts optimized_windows([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
  puts optimized_windows([1, 3, 2, 5, 4, 8], 5) == 6
  p optimized_windows((0...100000).to_a, 2000)
}
puts time.real
