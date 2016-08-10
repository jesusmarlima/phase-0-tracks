#----------- release 0-----------------------------------------------------

# this method just print the names of the students and the last name on the block that is passed.

#clear screen
def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
end


def print_names
  last_name = "Zambrano"
  print "Jesus"
  yield (last_name)
  last_name = "Lima"
  print "Jesusmar"
  yield (last_name)
end


clear_screen
puts(" - - - - release - - - - -")
print_names { |last_name| puts " last name is #{last_name}" }

puts " "
puts " "
#---------- release 1------------------------------------------------------

available_seats = ['a1','a2','a3','a4','b1','b2','b3','b4','c1','c2','c3','c4']
cars = {
  golf: 'VW',
  accord: 'Honda',
  passat: 'VW',
  civic: 'Honda',
  versa: 'Nissan',
  charger: 'Dodge',
  drango: 'Dodge'
}

def show_available_seats(available_seats)
  available_seats.each { |seat|
    puts "the seat #{seat} is available!"
  }
  puts " "
end

def change_available(available_seats, unavailable_seat)
  available_seats.map! { |seat|
    if (seat == unavailable_seat)
      seat = nil
    end
    seat
  }
end

def show_cars(cars)
  cars.each do |model,brand|
      puts "#{brand}: #{model}"
  end
  puts " "
end

def change_brands(cars,new_brand)
  cars.each do |model, brand|
    cars[model] = new_brand
  end
end

puts(" - - - - release1 - - - - -")
show_available_seats(available_seats)
change_available(available_seats,'a2')
show_available_seats(available_seats)

puts " --------------------  "

show_cars(cars)
change_brands(cars,"Lexus")
show_cars(cars)

puts " "

#------------------- release 2 ---------------------

#1 - A method that iterates through the items, deleting any that meet a certain condition

puts(" - - - - release2 - - - - -")
numbers = [1,2,3,4,5,6,7,8,9,10]
puts numbers.delete_if {|number|  number > 5 }.to_s
puts " ----------- "

#2 A method that filters a data structure for only items that do satisfy a certain condition
numbers = [1,2,3,4,5,6,7,8,9,10]
puts numbers.select {|number| number < 5 }.to_s
puts numbers.to_s


#3 - A different method that filters a data structure for only items satisfying a certain condition
numbers = [1,2,3,4,5,6,7,8,9,10]
puts numbers.collect {|number| number if number > 5}.to_s
puts " ----------- "
puts numbers.to_s


#4 - A method that will remove items from a data structure until the condition in the block evaluates to false,
puts numbers.to_s
puts "------------------------"
numbers.reject! {|number| number < 5 }.to_s
puts numbers.to_s
puts "------------------------"