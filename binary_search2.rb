class Binary

  def binary_search(an_array, item)
    first = 0
    last = an_array.length-1

    while (first <= last)
      i = (first + last) / 2

      if an_array[i] == item
        return "#{item} found at position #{i}"
      elsif an_array[i] > item
        last = i - 1
      elsif an_array[i] < item
        first = i + 1
      else
        return "#{item} not found in this array"
      end
    end
  end
end

binary = Binary.new
arr1 = [1,2,3,4,5]
arr = []
arr1.each do |a|
  arr.push a
end
arr.sort!
puts binary.binary_search(arr, 5)