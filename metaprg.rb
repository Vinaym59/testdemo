# class MyClass
#   def self.capitalize_name
#     name.upercase
#   end
# end

# puts MyClass.capitalize_name


class MyClass
  def print
    puts 'This is still old behavior'
  end
end

old_class = MyClass.new

# Modifying the original blue print or prototype
class MyClass
  def print
    puts 'Modified behavior'
  end
end

new_class = MyClass.new

old_class.print
new_class.print