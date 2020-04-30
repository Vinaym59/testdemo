class Gift
  def initialize(name,price)
    @name = name
    @price = price
  end
end

gift = Gift.new('book', 16)
gift1 = Gift.new('book', 13)
gifts = []
hash = {gift gift1}
# hash << gift
# hash << gift1
hash.instance_variables.each {|var| hash[var.to_s.delete("@")] = hash.instance_variable_get(var) }
p hash


# class Gift
#   def to_hash
#     hash = {}
#     instance_variables.each { |var| hash[var.to_s.delete('@')] = instance_variable_get(var) }
#     hash
#   end
# end


# h = Gift.new("Book", 19).to_hash
# h1 = Gift.new("Book", 20).to_hash


# class Gift
#   ATTRIBUTES = [:name, :price]
#   attr_accessor(*ATTRIBUTES)

#   def create_random_instance_variable
#     @xyz = 123
#   end

#   def to_h
#     ATTRIBUTES.each_with_object({}) do |attribute_name, memo|
#       memo[attribute_name] = send(attribute_name)
#     end
#   end
# end

# g = Gift.new
# g.name = "Foo"
# g.price = 5.25
# puts g.to_h

# g1 = Gift.new
# g1.name = "boo"
# g1.price = 4.45
# puts g1.to_h
