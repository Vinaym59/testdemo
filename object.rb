class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name, @price = name, price
  end

  def ==(other)
    self.name  == other.name &&
    self.price == other.price
  end

end

p1 = Product.new('book', 49)
p2 = Product.new('book', 49)
p3 = Product.new('book', 59)
p4 = Product.new('book', 69)
puts p1 == p2
puts p3 == p4