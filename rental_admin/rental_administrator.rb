require_relative 'rental_controller'

#clear screen

def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
  puts "Building Generator and rent managment Program"
  puts "----------------------------------------\n\n"

end

def main_options
  commands = {"1" => "See all buildings" ,
    "2" => "Set a unit as rented" ,
    "3" => "Create new Building",
    "4" => "Exit program"}

    commands.each do |option, description |
      puts "#{option}  - #{description} "
    end
    print "\n:>"
    gets_chomp(commands)
  end

  def return_to_main_Screen
    puts "\nAny key to return "
    print ":>"
    gets.chomp
    clear_screen
  end

  def show_return_option
    puts "\n000 - Return to main Screen"
    print ":>"
  end

  def show_success_message_return
    puts "Success - type any key to return to main screen"
    print ":>"
    gets.chomp
  end


  def see_buildings_screen(buildings)
   clear_screen
   puts "Please choose a building number for details:\n\n"
   options = {}
   buildings.each do |building|
    puts "#{building.id} - #{building.name}"
    options[building.id.to_s] = building
  end
  options["000"] = "Back"
  show_return_option
  option = gets_chomp(options)
  if option != "000"
    see_one_building(options[option],false)
  end
end

def see_one_building(building,to_rent)
  clear_screen
  if !to_rent
    puts "building: #{building}"
    @rental.print_building(building)
    return_to_main_Screen
  else
    puts "building: #{building}"
    @rental.print_building(building)
    puts "\nChoose on apartment to rent:"
    print ":>"
    options = {}
    building.apartments.each do |apartment|
      options[apartment.number] = apartment
    end
    ap = gets_chomp(options)
    apartment = building.apartments.select{|apart| apart.number == ap}
    apartment[0].rent_apartment
    see_one_building(building,false)
  end
end

def show_create_option
  clear_screen
  puts "The program accepts any numbers of floors and apartments per floor\nbut for a better look please create with a max of 10 apartments per\n floor!! it will depends of what size of yours screen :)\n"
puts "Please type the name of the building:"
print ":> "
name = gets.chomp
puts "how many floors the build have ? "
print ":> "
floors = gets.chomp.to_i
puts "how many apartments per floor the build have ?"
print ":> "
apts_per_floor = gets.chomp.to_i
if name.length > 0 && floors && apts_per_floor
  building = @rental.create_building(nil,name,floors,apts_per_floor)
  show_success_message_return
else
  puts "\nPlease type valid numbers and/or valid name\n"
  return_to_main_Screen
end
end

def list_all_buildings_to_rent(buildings)
  clear_screen
  "puts choose one building to get apartments to rent\n"
  options = {}
  buildings.each do |building|
    puts "#{building.id} - #{building.name}"
    options[building.id.to_s] = building
  end
  options["000"] = "Back"
  show_return_option
  option = gets_chomp(options)
  if option != "000"
    see_one_building(options[option],true)
  end
end

def initial_screen
  clear_screen
  option = main_options
end

def gets_chomp(options)
  option = gets.chomp
  if options[option]
    return option
  end
  puts "Please type a valid number #{options.keys}"
  gets_chomp(options)
end

#options = {"1" => 1,"2" => 2,"3" => 3,"000" => 0}
#gets_chomp(options)

#-----DRIVER CODE

SHOW_ALL_BUILINGS = "1"
SET_APARTMENT_AS_RENTED = "2"
CREATE_NEW_BUILDING = "3"
EXIT = "4"

@rental = Rental_controller.new
@rental.initial_setup
option = 0

buildings = @rental.buildings
if buildings.length == 0
  clear_screen
  puts "\nYour data base is empty, please lets create a Building to admistrate, Please type any key to continue! :>"
  gets.chomp
  show_create_option
  buildings = @rental.buildings
end

while option != EXIT
  option = initial_screen
  if option == SHOW_ALL_BUILINGS
    see_buildings_screen(buildings)
  elsif option == SET_APARTMENT_AS_RENTED
    list_all_buildings_to_rent(buildings)
  elsif option == CREATE_NEW_BUILDING
    show_create_option
  end
  buildings = @rental.buildings
end