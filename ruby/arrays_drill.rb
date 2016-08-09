arr = []
p arr

(1..5).each do |item|
  arr << item
end

p arr

arr.delete(arr[2])

p arr

arr[2] = "test"

p arr

arr.shift

p arr

puts "has arr the number 2? #{arr.include?(2)}"

new_arr = [1,2,4]

another_array = arr + new_arr

p another_array