class Comapare
  # include Comparable

  attr_accessor :i, :a

  def initialize(i,a)
    @i = i
    @a = a
  end

  # def ==(other)
  #   self.i == other.i &&
  #   self.a == other.a
  # end

  def set_data
    puts "#{@i} #{@a}"
  end
end

cmp = Comapare.new(9,'yy')
cmp1 = Comapare.new(90,'yy')

numbers = [cmp, cmp1]
puts numbers.inspect
puts cmp.i == cmp1.i

puts cmp.a == cmp1.a

numbers.each {|ii| if ii.i == ii.i}

# numbers.each {|i|
#   if cmp == cmp1
#     puts i
#     y+=s1
#   end
# }

# number = [1,5,8]
# number.each do |it|
#   puts it if it == 5
# end


# for i in numbers
#   if i[0] == i[1]
#     puts i.set_data
#   end
# end

# puts i

# p cmp
# puts cmp
# puts cmp.to_s
# p cmp :i
# puts cmp[0].inspect


# [cmp,cmp1].each do |n|
#     puts n.inspect
#   else
#     puts "error"
#   end
# end