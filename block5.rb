class Demo

  def numbers
    a = [3,5,7,9]
    a.each do |n|
      puts "Array values are #{n}"
    end
  end

  def single_line_numbers
    a = [3,5,7,9]
    a.each {|n| puts "Array values are #{n}"}
  end
end

demo = Demo.new
demo.numbers
demo.single_line_numbers