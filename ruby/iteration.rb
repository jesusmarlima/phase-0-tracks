#----------- release 0-----------------------------------------------------

# this method just print the names of the students and the last name on the block that is passed.

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

show_available_seats(available_seats)
change_available(available_seats,'a2')
show_available_seats(available_seats)

puts " --------------------  "

show_cars(cars)
change_brands(cars,"Lexus")
show_cars(cars)



