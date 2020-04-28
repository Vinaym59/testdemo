class Stack

  def initialize(arr_size)
    @arr_size = arr_size
    @arr = Array.new(arr_size)
    @count = -1
  end

  def push_store(ele)
    if full? || ele.nil?
      puts "array is full"
    else
      @count = @count + 1
      @arr[@count] = ele
    end
  end

  def print_stck
    @arr.each {|a| puts a}
  end

  def pop
    if isempty?
      puts "Array values are nil"
    else
      arr_pop = @arr.pop
      @count = @count - 1
      puts arr_pop
    end
  end

  def peek
    if isempty?
      puts "Array values are nil"
    else
      arr_peek = @arr[@count]
      puts "the peek value is #{arr_peek}"
    end
  end

  def my_sort
    @arr.sort
  end

  def binary_search(n)

    if n < 0
      puts "sorry not possible enter positive number"
    end

    my_sort
    low = 0
    high = my_sort.length - 1

    while (low <= high)
      mid = (low + high) / 2

      if my_sort[mid] == n
        return "the #{n} value n is present #{mid}"
      elsif my_sort[mid] > n
        high = mid - 1
      elsif my_sort[mid] < n
        low = mid + 1
      else
        return "value #{n} is not present"
      end
    end
  end

  def isempty?
    @count == -1
  end

  private

  def full?
    @count == (@arr_size - 1)
  end

end

stack = Stack.new(10)
stack.push_store(15)
stack.push_store(4)
stack.push_store(5)
stack.push_store(2)
stack.push_store(3)
stack.push_store(7)
stack.push_store(9)
stack.push_store(8)
stack.push_store(11)
stack.push_store(10)


# stack.my_sort
puts stack.binary_search(-1)
puts stack.binary_search(15)
puts stack.binary_search(3)
puts stack.binary_search(2)
# puts stack.binary_search(3)
# puts stack.binary_search(10)
# puts stack.binary_search(7)
# puts stack.binary_search(6)
# puts stack.binary_search(9)
# puts stack.binary_search(4)

stack.pop
stack.pop
stack.pop

puts stack.isempty?

puts stack.peek





