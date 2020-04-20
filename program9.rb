def is_prime?(n)
  return false if n < 2
  return true if n == 3 || n == 2
    if (2...n-1).any?{|i| n % i == 0}
      puts "its not prime number"
    else
      puts "its a prime number"
    end
end

puts is_prime?(gets.chomp.to_i)