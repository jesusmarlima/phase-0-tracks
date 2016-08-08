#Clear screen
#my_hash variable to store the keys and values
#ask user the questions and store in the hash
#convert variables to the right type

#converting back to string when needed
#print out all the answers

# Ask users if they want to change some inserted values
#print out all the answers again

def convert_str_to_boolean(str)
  str == "y" ? true : false
end

def convert_boolean_to_str_if_needed(value)
  if value.to_s == "true"
    "yes"
  elsif value.to_s == "false"
    "No"
  else
    value
  end
end

def get_information_from_user(client_data)
    print "Name:"
    client_data[:name] = gets.chomp
    print "Age:"
    client_data[:age] = gets.chomp.to_i
    print "Number of children:"
    client_data[:'number of children'] = gets.chomp.to_i
    print "Deccor Theme:"
    client_data[:'deccor theme'] = gets.chomp
    print "Accessibility ? (y/n)"
    client_data[:accessibility] = convert_str_to_boolean(gets.chomp)
    #if accessiblity is yes, i ask what is needs
    if client_data[:accessibility]
      print "Accessibility needs:"
      client_data[:'accessibility needs'] = gets.chomp
    end
    client_data
end

def show_data(client_data)
  puts " "
  puts "Answers:"
  puts " "

  client_data.each do |k,v|
    puts "#{k.to_s.capitalize}: #{convert_boolean_to_str_if_needed(v)}"
  end
  puts " "
end

def update(key,client_data)
  puts " "
  print "please type the new value of #{ key }: "

  # if the user changes accessibility
  # - yes to no, I need to delete the accessbility needs field
  # - no to yes, I need to ask what are needs

  if key.to_sym == :accessibility
    print "(y,n) "
    client_data[key.to_sym] = convert_str_to_boolean(gets.chomp)
    #after changed I ask to know if need to delete or add accessibility needs
    if client_data[:accessibility]
      print "Accessibility needs:"
      client_data[:'accessibility needs'] = gets.chomp
    else
      client_data.delete(:'accessibility needs')
    end
    #just to know if I need to storage interger or not
    elsif key.to_sym == :age || key.to_sym == :'number of children'
        client_data[key.to_sym] = gets.chomp.to_i
    else
        client_data[key.to_sym] = gets.chomp
    end
end


#  MAIN PROGRAM
  # clear screen
  Gem.win_platform? ? (system "cls") : (system "clear")
  client_data = {}
  client_data = get_information_from_user(client_data)
  show_data(client_data)

  #Ask if the user wants to change something that was typed
  print "if you want to update some value above, please type the label of the value you \n want to change and press enter, otherwise type 'none':"
  answer_key = gets.chomp.downcase
  #none to finish the program
  if answer_key != 'none'
          #this line below compare what was typed to know if exist in hash, if true I change the value with 'update' method and show again
          if client_data.keys.include?(answer_key.to_sym)
            update(answer_key,client_data)
            show_data(client_data);
          else
            puts "the #{answer_key} label you wrote does not exists, please execute the program again!"
        end
  end
  puts " "
  puts "end of program"
