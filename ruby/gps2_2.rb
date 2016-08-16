# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # [fill in any steps here]
  # create a method thats splits a string in an array
  # we will use a hash to store the string splited string
  # set default quantity
  # use (paran=0) to set the starting default amount
  # print the list to the console [can you use one of your other methods here?]
  # create a stored Method
# output: [what data type goes here, array or hash?]
# hash is better because we can store and change all the information needed.

def list_creator(input_items)
  items_array = input_items.split(" ")

  list_items = Hash.new(0)
  items_array.each do |item|
    if list_items[item] != 0
      list_items[item] +=1
    else
      list_items[item] = 1
    end
  end
  return list_items
end



# Method to add an item to a list
# input: item name and optional quantity
# steps:
# output:

def add_items(list_items, item, amount)
  list_items[item] += amount
  return list_items
end

items =  list_creator("apples oranges apples")

puts items

puts "-----------------------"

add_items(items,"lemonade",6 )
add_items(items,"tomatos",3 )
add_items(items,"onions",1 )
add_items(items,"ice-cream",4 )
add_items(items,"apples",4 )


puts items

# Method to remove an item from the list
# input: item
# steps: use delete methods
# output: deleted item from the list

def remove_item(list_items,item)
  list_items.delete(item)
  item
end

puts remove_item(items,'lemonade')
puts items


# Method to update the quantity of an item
# input: amount, list_items , item to update
# steps: update the value
# output: new amount

def update_amount(items, item, amount)
    items[item] = amount
    items[item]
end

update_amount(items,'ice-cream', 1)
puts items

# Method to print a list and make it look pretty
# input: hash of items
# steps: do a loop to print each item and amount
# output: item and amount

def grocery_list(items)
  puts "This is my grocery list:\n"
  items.each do |item, amount|
    puts "#{item} = #{amount} "
  end
end

grocery_list(items)

