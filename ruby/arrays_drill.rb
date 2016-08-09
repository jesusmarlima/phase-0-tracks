def add_to_array(array,element)
  array << element
  array
end

def build_array(one,two,three)
  arr = [one,two,three]
end


#initialize black array
arr = []

p arr

puts " "

#adding 5 element into array
(1..5).each do |item|
  arr << item
end

p arr

puts " "

#deleting index 2
arr.delete(arr[2])

p arr

puts " "

#add new element at index 2
arr[2] = "test"

p arr

puts " "

#deleting first element
arr.shift

p arr

puts " "

#asking if number 2 is inside the array
puts "has arr the number 2? #{arr.include?(2)}"

puts " "

#declaring a new array with itens already inside
new_arr = [1,2,4]

#concatenating arrays
another_array = arr + new_arr

p another_array

puts " "

#calling the method that creates a array with given 3 parameters
p build_array(1,'two',nil)

puts " "

#calling the method that add a new element to an array
p add_to_array(build_array(1,'two',nil),"adding to array")

puts " "

#calling the method that add a new element to an array (adding method call)
p add_to_array([],build_array(1,'two',nil))