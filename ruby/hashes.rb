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

def get_information_from_user(hash)
    print "Client name:"
    hash[:name] = gets.chomp
    print "Client age:"
    hash[:age] = gets.chomp.to_i
    print "Number of childreen:"
    hash[:'number of childreen'] = gets.chomp.to_i
    print "Deccor Theme:"
    hash[:'decor theme'] = gets.chomp
    print "is accessibility needed? (y/n)"
    hash[:accessibility] = convert_str_to_boolean(gets.chomp)
    if hash[:accessibility]
      print "accessibility needs:"
      hash[:'accessibility needs'] = gets.chomp
    end
    hash
end

def show_data(hash)
  puts " "
  puts "Answers:"
  puts " "

  hash.each do |k,v|
    puts "#{k.to_s.capitalize}: #{convert_boolean_to_str_if_needed(v)}"
  end
  puts " "
end

def update(str,hash)
  puts " "
  print "please type the new value of #{ str }: "
  if str.to_sym == :accessibility
    print "(y,n) "
    hash[str.to_sym] = convert_str_to_boolean(gets.chomp)
    if hash[:accessibility]
      print "accessibility needs:"
      hash[:'accessibility needs'] = gets.chomp
    else
      hash.delete(:'accessibility needs')
    end
    elsif str.to_sym == :age || str.to_sym == :'number of childreen'
        hash[str.to_sym] = gets.chomp.to_i
    else
        hash[str.to_sym] = gets.chomp
    end
end


#  MAIN PROGRAM
  # clear screen
  Gem.win_platform? ? (system "cls") : (system "clear")
  my_hash_decorator = {}
  my_hash_decorator = get_information_from_user(my_hash_decorator)
  show_data(my_hash_decorator)
  print "if you want to update some value above, please type the label of the value you \n want to change and press enter, otherwise type 'none':"
  str =  gets.chomp.downcase
  if str != 'none'
          if my_hash_decorator.keys.include?(str.to_sym)
            update(str,my_hash_decorator)
            show_data(my_hash_decorator);
          else
            puts "the #{str} label you wrote does not exists, please execute the program again!"
        end
  end
  puts " "
  puts "end of program"
