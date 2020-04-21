def get_arr(a)
  a.pop
end

def select_arr(a)
  a.select {|i| i>2}
end

a = [1,2,3,4,5,6,7]
get_arr(a)
puts select_arr(a)

puts a