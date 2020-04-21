class DemoTwo

  def demo_publ
    self.demo_protec
    puts "Hi am public member"
  end

  def demo_publ_sec
    demo_prv
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

demo = DemoTwo.new
demo.demo_publ
demo.demo_publ_sec

