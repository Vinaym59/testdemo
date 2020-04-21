puts "HAi" * 3
puts "Hi" * 0


puts "string" + self.to_s

puts "abcd" <=> "abcde"
puts "abcd" <=> "abcd"
puts "abcde" <=> "abcd"

puts "hello".byteslice(1)
puts "hello".byteslice(1,2)
puts "hello".byteslice(1..3)
puts "hello".capitalize
puts "HeLLO".capitalize
puts "hello".center(10)
puts "123capITalize".capitalize
puts "hello".center(10,'123')

puts "test\n\r".chop
puts "x".chop
puts "test\r\n".chop

 a = "test"
puts a.chr

puts "testone".delete "o"

puts "testone".delete "to"
puts "HELLO".downcase

"hello".each_byte {|a| puts a,''}

puts "hello".empty?
puts "".empty?
puts " ".empty?

puts "string" == "string"

puts "string".eql?"ssstring"

puts "string".freeze()

puts "string".gsub('r', 'a')

puts "stringone".include? "one"

puts s = 'string'.to_sym

puts 'cat'.to_sym

puts 'dog'.reverse

extra_space = "    test    "
puts extra_space.strip


puts a = ['a','b', 'c','d']
puts a.join

puts "88".to_i
