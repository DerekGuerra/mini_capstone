def awesome_sauce_machine(array)
  awesome_array = []
  index = 0
    array.length.times do
      awesome_array << array[index] + "#{Awesomesauce!}"
      index += 1
    end
  return awesome_array
end

awesome_sauce_machine(["a", "b", "c", "d", "e"])