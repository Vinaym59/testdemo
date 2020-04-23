class Salad
  def initialize
    @ingredients = []
  end

  def add_nuts
    @ingredients << :my_salad
    self
  end

  def ==(other)
    self == other
  end
end

my_salad = Salad.new
my_salad1 = Salad.new
my_salad.add_nuts
my_salad1.add_nuts

