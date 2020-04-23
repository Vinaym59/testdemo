class Animal

  def test
    puts "Am Animal test"
  end

  def say
    puts "say somthing here"
  end

  def legs(count)
    puts "all animals have #{count} legs"
  end

  def eyes
    yield
  end

  def food
    puts "have veg and non veg both"
  end
end

class Cat < Animal
end

class CityCat < Cat

  def food
    super
  end
end

class Dog < Animal

  def test
    puts "Am a Dog"
    super
  end

  def say(message)
    puts "say somthing child #{message}"
    super()
  end

  def legs(count)
    puts "i have #{count} legs"
    super
  end

  def eyes
    super
  end
end

dog = Dog.new
dog.test
dog.say("testing  say")
dog.legs(4)
dog.eyes{puts "Hi all animals have 2 eyes even dog too"}
city_cat = CityCat.new
city_cat.food


