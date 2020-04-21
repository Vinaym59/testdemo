a = [1,3,5]

b = [2,3,5]

puts a == b

b.pop(5)

b.unshift(1)

puts a == b

puts a.include?(5)

c = [1,4,7,8,9,0,22]

c.each_with_index{|i,j| puts "value #{i} and index #{j}"}