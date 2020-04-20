module A
  def method_a
    puts "abc instance method"
  end
end

module B
  def method_b
    puts "class method uses"
  end
end

class Person
  include A
  extend B
end

 person = Person.new
 person.method_a

 Person.method_b