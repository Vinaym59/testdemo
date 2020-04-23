def test(s)
    # See if the Shape's color is red.
  puts(s.color == "red")
end

class Shape
  def initialize(color)
    @color = color
  end

  def color
    puts @color
  end

  def analyze()
    # Pass this object to another method.
    test(self)
  end
end

# Create Shape and call the analyze method.
s = Shape.new("red")
s.analyze()
s.color