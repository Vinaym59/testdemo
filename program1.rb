module Constants
  Age = 18
end

require 'date'
class Person

  include Constants
  attr_accessor :first_name
  attr_accessor :last_name
  attr_reader :company_name
  attr_writer :company_name
  attr_reader :first_name
  @@object_count = 0
  @@company_name = ""

  def initialize(first_name,last_name,email,birth_date)
    @@first_name = first_name
    @@last_name = last_name
    @@email = email
    @birth_date = birth_date
    @@object_count = @@object_count+1
  end

  def full_name
    puts "full name #{@@first_name}#{@@last_name}"
  end

  def user_birth_date
    puts "#{@birth_date}"
  end

  def self.no_of_object
    puts "#{@@object_count}"
  end

  def user_age
   @age = (DateTime.now - @birth_date) / 365.25
   return @age.to_i
  end

  def age_type
    case @age.to_i
    when 1..18
      puts "minor"
    when 18..59
      puts "major"
    when 60..100
      puts "game over"
    end
  end

  def self.obj_list
    @objects ||= []
    @objects.each { |x| puts x.full_name, x.user_birth_date }
  end
end

person1 = Person.new("saravana","n","saravana@gmail.com",Date.parse('1988-02-29'))
person1.company_name = "sumeru"
puts person1.full_name
puts person1.company_name
puts person1.user_birth_date
puts person1.user_age
puts person1.age_type
Person.obj_list.push(person1)
puts Person.obj_list

person2 = Person.new("kranthi","kisore","kranthi@gmail.com",Date.parse('1988-03-29'))
person2.company_name = "Entiger"
puts person2.full_name
puts person2.company_name
puts person2.user_birth_date
puts person2.user_age
puts person2.age_type
Person.obj_list.push(person2)
puts Person.obj_list

person3 = Person.new("kiran","kumar","kirankumar@gmail.com",Date.parse('1989-04-09'))
person3.company_name = "IBM"
puts person3.full_name
puts person3.company_name
puts person3.user_birth_date
puts person3.user_age
puts person3.age_type
Person.no_of_object
Person.obj_list.push(person3)
puts Person.obj_list

# [person1, person2, person3].each { |top| puts top.full_name, top.user_birth_date }
