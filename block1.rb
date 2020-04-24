class Block

  def explicit_block(&block)
    block.call # same as yield
  end

  def do_something_with_block
    return puts "No block given" unless block_given?
    yield
  end
end

blck = Block.new
blck.explicit_block { puts "block test"}
blck.do_something_with_block
blck.do_something_with_block { puts "block given"}