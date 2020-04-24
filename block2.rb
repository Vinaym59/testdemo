class Block
  my_lambada = -> {puts "my lambada"}
  def test
    my_lambada.call
  end

end

block = Block.new
block.test
