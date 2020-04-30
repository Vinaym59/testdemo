VERIFIED = Object.new
class Order < Struct.new(:id,:name,:age)
end

def VERIFIED.===(obj)
  puts obj.name.to_s == "verified"
end

VERIFIED === Order.new(2, "verified", "Rita")

VERIFIED === Order.new(2, "test", "Rita")