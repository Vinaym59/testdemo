class Fruits

  def test_method
    bannan = "test bananan"

    puts bannan
    puts self.bannan
  end

  def bannan
    "Tastey"
  end
end

fruit = Fruits.new

fruit.test_method
