require_relative 'rental_controller'

#clear screen
def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
  puts "Building Generator and rent managment Program"
  puts "---------------------------------------------\n\n"

end

# this returns a main menu
def main_options
  commands = {"1" => "See all buildings" ,
    "2" => "Set a unit as rented/avalilable" ,
    "3" => "Create new Building",
    "4" => "Exit program"}

    commands.each do |option, description |
      puts "#{option}  - #{description} "
    end
    print "\n:>"
    gets_chomp(commands)
  end

# this retuns an option to back to the main screen with out "sucess message"
def return_to_main_Screen
    puts "\nAny key to return "
    print ":>"
    gets.chomp
    clear_screen
end

  # this method gives a option to return to the main screen before the  execution of an operarion
  def show_return_option
    puts "\n000 - Return to main Screen"
    print ":>"
  end

  # after updates returns to the main screen
  def show_success_message_return
    puts "Success - type any key to return to main screen"
    print ":>"
    gets.chomp
  end


  # method shows all buildins to select to details
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

# method prints a building apartments
# the parameter to_rent will define if this screen was called by rent command or show comand

def see_one_building(building,to_rent)
  clear_screen
  if !to_rent
    puts "Building: #{building}"
    @rental.print_building(building)
    return_to_main_Screen
  else
    puts "Bsuilding: #{building}"
    @rental.print_building(building)
    puts "\nChoose one apartment to rent/unrent or '000' to cancel the operation."
    print ":>"
    options = {}
    building.apartments.each do |apartment|
      options[apartment.number] = apartment
    end
    options["000"] = "Back"
    ap = gets_chomp(options)
    if ap != '000'
      apartment = building.apartments.select{|apart| apart.number == ap}
      apartment[0].rent_apartment
      see_one_building(building,false)
    end
  end
end

# this will be call id the user wants to create a new building or if the database is empty
def show_create_option
  clear_screen
  puts "The program accepts any numbers of floors and apartments per floor but, for a better look please create with a max of 10 apartments per floor.\nThe alignment will depends of the size of your screen :).\n\n"
puts "Please type the name of the building:"
print ":> "
name = gets.chomp
puts "How many floors the build have ? "
print ":> "
floors = gets.chomp.to_i
puts "How many apartments per floor the build have ?"
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

# this will list all buildings to rent
def list_all_buildings_to_rent(buildings)
  clear_screen
  puts "Choose one building to get apartments to rent\n\n"
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

# this is the main screen
def initial_screen
  clear_screen
  option = main_options
end

# This I created to control what is typed by the user.
# if what was typed was not in the options hash, the programs ask to type again .
def gets_chomp(options)
  option = gets.chomp
  if options[option]
    return option
  end
  puts "Please type a valid number #{options.keys}"
  gets_chomp(options)
end

#-----DRIVER CODE

# constants to make the code more readable, just to use at the if below
SHOW_ALL_BUILINGS = "1"
SET_APARTMENT_AS_RENTED = "2"
CREATE_NEW_BUILDING = "3"
EXIT = "4"

# create a instance of the controller to manage the classes
@rental = Rental_controller.new
# calling the initial database setup
@rental.initial_setup

# just to enter in the loop first time
option = 0

# load all buildings from data base
buildings = @rental.buildings

#first time is the base is empty
if buildings.length == 0
  clear_screen
  puts "\nYour database is empty. Lets create a Building to admistrate!\nPlease type any key to continue! :>"
  gets.chomp
  show_create_option
  #refreshing the buildings
  buildings = @rental.buildings
end

# this is the main of program here are the options and will stop when the user choose 4 = Exit
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

puts "End of Program - Thanks for using!!!"