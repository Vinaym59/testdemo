puts time_now = Time.now

puts "Heloo today date timing is \n #{time_now}"


puts "Enter Your Name"
name = gets.chop
puts  "my name is #{name}"


if name == "vinay"
  puts "its you only"
else
  puts "its not vinay"
end

a,b,c  = 5,7,2

if a>=b and a>=c
  puts "A is greater"
elsif b>=a and b>=c
  puts "B is greater"
else
  puts "c is greater"
end


puts "Testing Unless condition"

my_age = gets.to_i
puts "AM minor" unless my_age>=18


puts "Checking Case"

number = gets.to_i

case number
  when 1
    puts "its one"
  when 2
    puts "its two"
  when 3
    puts "its three"
  when 4
    puts "its four"
  else
    puts "its more then 5"
  end


  puts "your enter number is #{number}"


  v,x = 4,5,6
  z = v > x ? v:x
  puts "max = #{z}"


  puts "Enter 10 numbers"

  10.downto 2 do |i|
    puts i
  end

  puts "enter even number 1 to 100"

  100.step 10,-2 do |i|
    puts i
  end

  rice_sq = 1

  64.times do |sq|
    puts "On square #{sq} are #{rice_sq}"
    rice_sq *=2
  end



