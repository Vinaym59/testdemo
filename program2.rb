class Person
  attr_accessor :name, :age, :city

  def initialize(name,age,city)
    @name = name
    @age = age
    @city = city
  end
end

class Male < Person
  attr_accessor :gender

  def initialize(name,age,city,gender)
    super(name,age,city)
    @gender = gender
  end

  def demo_male
   puts "#{@gender},#{@name}, #{@age}, #{@city}"
  end
end


class FeMale < Person
  attr_accessor :gender

  def initialize(name,age,city,gender)
    super(name,age,city)
    @gender = gender
  end

  def demo_female
   puts "#{@gender},#{@name}, #{@age}, #{@city}"
  end
end


male = Male.new("mohan",24,"mandya","male")
male.demo_male

male = FeMale.new("pooja",24,"mandya","female")
male.demo_female

