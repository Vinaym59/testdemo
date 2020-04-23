class Person
  # attr_accessor :name,:age,:city

  def details
  end

end

Person = Struct.new(:name,:age,:city)
moni = Person.new "mohni",30,"mandya"
tony = Person.new "tony",31,"maddur"
moni = Person.new "mohni",37,"mandya"
puts moni.name
puts moni.name
puts tony == moni
puts moni == moni

puts [moni, moni, tony].max_by(&:age)
