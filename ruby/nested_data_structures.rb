#Studio Music Records, this studio has two music rooms and one control room, one bar and a rooftop to enjoy the view
#the rooms are classified by type of music, classic and rock, and each one a set of instruments
# what this program do ?
#      this program show the struture of the studio
#      ask user to add a new instrument on the ROCK room or change the amount of one instrument at te ROCK room
#      ask user to add an instrument to the classic room


guitars = { :'acustic guitar' => 2,
  :'eletric guitar' => 2 ,
  :'bass guitar' =>  1
}

microphones = { :'lead mic' => 1,
  :'back mic' => 3
}
amps = {  :'bass amp' => 1,
  :'guitar amp' => 4,
  :'keyboard amp'=> 1,
  :'vocals amp' =>  4
}

drumkit = {
  :'bass drum' => 1,
  :'snare drum' => 1,
  :'tom toms' => 1,
  :'floor tom' => 1,
  :'hi-hat' => 1,
  :'crash cymbal'=> 1,
  :'ride cymbal' => 1
}

keyboard = {
  piano: 1,
  synthesizer: 1
}

chairs = ['blue chair', 'white chair', 'green chair', 'black chair']

studio = {
  rooms: [
    rock: [guitars, microphones, amps, drumkit, keyboard],
    classic: ['piano', 'tabla', 'sitar', 'sarod', 'violin', 'cello'],
    control: ['computer', 'audio_interface', 'monitor managment']
    ],
    bar: ['beer', 'wiskey', 'refrigerator', 'food'],
    rooftop: ['cinder-box', 'sofa', 'table', chairs]
  }

# methods to access the nested structure

#given a string this method return a index of array of instruments types
def instrument_to_index(instrument_type)
  case instrument_type
  when "guitars"
    0
  when "microphones"
    1
  when "amps"
    2
  when "drumkit"
    3
  when "keyboard"
    4
  else
    puts "next time, please choose one in this list: (guitars,microphones,amps,drumkit,keyboard)"
    puts
    exit
  end
end

def update_numbers_of_instruments_to_the_rock_room(studio,instrument_type,instrument,new_number_of_instrument)
  index_of_intrument_type = instrument_to_index(instrument_type)
  studio[:rooms][0][:rock][index_of_intrument_type][instrument.to_sym] = new_number_of_instrument
end

def show_instruments_by_type(studio,instrument_type)
  index_of_intrument_type = instrument_to_index(instrument_type)
  puts studio[:rooms][0][:rock][index_of_intrument_type].keys
  puts " "
end

def add_instruments_to_classic_room(studio,instrument)
  studio[:rooms][0][:classic].push(instrument)
end

#this method print the array of chairs that exists on rooftop
def print_chairs(inside_room)
  chairs = " "
  inside_room.each do |value|
    chairs << value << ", "
  end
  puts "                " + chairs.chop.chop
end

#this method print the content of music rooms
def print_inside_music_room(instruments)
  instruments.each do |instrument|
    if instrument.is_a?(String)
     puts "                           #{instrument}"
   else instrument.is_a?(Hash)
     instrument.each do |instrument,amount|
      puts "                           #{amount}: #{instrument}"
    end
  end
end
end

def show_rooms(studio)
  #as my studio structure is complex (hashs or strings inside of arrays inside of a hash), I had to aks the type of nested element to know how to access
  # I amd doing this using the method "is_a(Class)"

  studio.each do |environment_type,environment_value|
    puts "Environment: #{environment_type}"
    environment_value.each do |inside_rooms|
      if inside_rooms.is_a?(String)
        puts "                 #{inside_rooms}"
      elsif inside_rooms.is_a?(Hash)
        inside_rooms.each do |room_type,instruments|
          puts "             Room Type: #{room_type}"
          print_inside_music_room(instruments)
        end
      else
        print_chairs(inside_rooms)
      end
    end
  end
  puts " "
end

def show_studio_structure(studio)
  show_rooms(studio)
end

def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
  puts "Ruby Studio Music Records"
  puts " "
end

#----------------------------------------------------------------------------------------------------------------------------

#MAIN program

clear_screen
show_studio_structure(studio)
print "To change number of instruments of rock room, please type \n the category of the instrument (guitars,microphones,amps,drumkit,keyboard):"
instrument_type = gets.chomp
clear_screen
show_instruments_by_type(studio,instrument_type)
print "Please type a instrument of the list above, or type a new instrument of this category: "
instrument = gets.chomp
print "Please type the new number of instrument do you want: "
update_numbers_of_instruments_to_the_rock_room(studio,instrument_type,instrument,gets.chomp.to_i)
clear_screen
show_studio_structure(studio)

print "please add an instrument to the classic room, please type a intrument:"
instrument = gets.chomp
add_instruments_to_classic_room(studio,instrument)
clear_screen
show_studio_structure(studio)

puts "END OF PROGRAM, THANKS!!!"


