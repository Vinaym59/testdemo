def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end
puts "Enter the number of terms:-"
puts fibonacci(gets.chomp.to_i)