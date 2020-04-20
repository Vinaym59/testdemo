$global_vlaue1 = 10
class Test
  @@class_vlaue = 20
  def print_global_test
    total = $global_vlaue1 + @@class_vlaue
    $global_vlaue1 = $global_vlaue1 + 1
    puts "My value is in global global_vlaue #{total}:"
    puts "change global value #{$global_vlaue1}"
  end
end

class Test1 < Test
  def print_global_test1
    total1 = $global_vlaue1 + @@class_vlaue
    puts "my name is in global global_vlaue class 2 : #{total1}:"
  end
end


obj1 = Test.new
obj1.print_global_test
obj2 = Test1.new
obj2.print_global_test1