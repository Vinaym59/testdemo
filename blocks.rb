class Block

  def print_once
    yield
  end

  def print_two_times
    yield
    yield
  end

  def one_two_three
    yield 1
    yield 2
    yield 3
  end

  def my_method
    yield("kiran",30)
  end
end

bl = Block.new
bl.print_once {puts "print once method value"}
bl.print_two_times {puts "print two times"}
bl.one_two_three { |n| puts n*2 }
bl.my_method do |n,a|
  puts "my name #{n} and my age is #{a}"
end
bl.my_method {|name,age| puts "my name #{name} and age #{age}"}