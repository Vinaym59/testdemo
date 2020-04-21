first_week = Array.new
puts first_week.empty?

first_week = Array.new(7)
puts first_week


first_week = Array.new(7,"week1")
puts first_week


first_week = Array["day1","day2","day3","day4","day5","day6","day7"]
puts first_week

puts first_week.size

puts first_week[2]

puts first_week.at(0)

puts first_week.last

puts first_week[2,4]


second_week = ["day8","day9","day10"]
puts month = first_week+second_week


puts second_week << "day11" << "day12"

color = ["red","green","orange"]
color << "white"
puts color

puts color.pop


puts color.insert(2,"yelllow")


puts color.delete_at(1)


puts number = [10,2,3,4,15,6,70]
puts number.sort


numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts numbers.select {|n| n > 4}