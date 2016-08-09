#Studio Music Records, this studio has two music rooms and one control room, one bar and a rooftop to enjoy the view
#the rooms are classified by type of music, classic and rock, and each one a set of instruments

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


chairs = ['blue_chair','white_chair','green_chair','black_chair']

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

def update_numbers_of_instruments_to_the_rock_room(studio,instrument_type,instrument,number_of_instruments_to_add)
  index = case instrument_type
            when "guitars"
              0
            when "microphones"
              1
            when "amps"
              2
            when "drumkit"
              3
            else
              4
          end
studio[:rooms][0][:rock][index][instrument.to_sym] = number_of_instruments_to_add
end

def show_instruments_by_type(studio,instrument_type)
  index = case instrument_type
            when "guitars"
              0
            when "microphones"
              1
            when "amps"
              2
            when "drumkit"
              3
            else
              4
          end
puts studio[:rooms][0][:rock][index].keys.to_s
puts " "
end

def add_instruments_to_classic_room(studio,instrument)
  studio[:rooms][0][:classic].push(instrument)
end

def show_rooms(studio)
  studio.each do |key,value|
    puts "#{key}"
      value.each do |inside_room|
              if inside_room.is_a?(String)
                puts "        #{inside_room}"
              elsif inside_room.is_a?(Hash)
                inside_room.each do |k,v|
                    puts "        #{k}"
                    v.each do |inside_music_room|
                        if inside_music_room.is_a?(String)
                           puts "                 #{inside_music_room}"
                        else inside_music_room.is_a?(Hash)
                           inside_music_room.each do |k,v|
                            puts "                #{v} : #{k}"
                           end
                        end
                    end
                end
              else
                print "        "
                chairs = ""
                inside_room.each do |value|
                    chairs << value << ", "
                end
                puts chairs.chop.chop
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

puts "please add an instrument to the classic room, please type a intrument:"
instrument = gets.chomp
add_instruments_to_classic_room(studio,instrument)
clear_screen
show_studio_structure(studio)

puts "END OF PROGRAM, THANKS!!!"


