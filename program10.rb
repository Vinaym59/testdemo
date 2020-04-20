obj = gets.chomp.length
case obj
  when 1..2
    puts "Length of string less than 3"
  when 3
    puts "Length of string is equal to 3"
  when 4..10
    puts 'Length of string greater than 4 and less than 10'
  else
    puts 'Length of string greater than 10'
end
