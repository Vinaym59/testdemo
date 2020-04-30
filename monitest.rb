
require 'pry'

class Test

  include Comparable

  attr :age

  def initialize(name,age)
    @name = name
    @age = age
  end

  def <=>(other)
    @age <=> other.age
  end

  def print_data
    puts "#{@age} #{name}"
  end
end

test1 = Test.new('moni',8)
test2 = Test.new('sony',5)
test3 = Test.new('sony',6)
test4 = Test.new('sony',2)


arr = [test1,test2,test3,test4]
puts arr
arr.sort!
puts arr.inspect