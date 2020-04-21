class Demo

  def demo_publ
    puts "Hi am public member"
  end

  def demo_publ_sec
    puts "Hi am second public member"
  end

  private

  def demo_prv
    puts "Hi am private member"
  end

  protected

  def demo_protec
    puts "am protected member"
  end
end

demo = Demo.new
demo.demo_publ
demo.demo_publ_sec
demo.demo_prv
demo.demo_protec
