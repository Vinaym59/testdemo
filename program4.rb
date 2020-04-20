class Demo
 def get_age(n)
  @demo_age = n
 end

 def increment_age()
  @demo_age +=1
 end

 def display_details()
  puts "Geek age is #{@demo_age}"
 end

end

obj = Demo.new

obj.get_age(20)
obj.display_details()
obj.increment_age()
obj.display_details()