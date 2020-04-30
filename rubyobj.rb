# require 'ostruct'

BaseGift = Struct.new(:name, :price)
class Gift < BaseGift
  def initialize(name, price)
    super(name, price)
  end
  # ... more user defined methods here.
end

g = Gift.new('pearls', 20)
gg = Gift.new('gems', 30)

puts gg.to_h
puts g.to_h