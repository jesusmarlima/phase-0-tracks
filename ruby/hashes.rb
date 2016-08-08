#Clear screen
#hash variable to store the keys and values
#ask user the questions and store in the hash

#convert variables to the right type

#print out all the answers

Gem.win_platform? ? (system "cls") : (system "clear")

hash = {}

print "Client name:"
hash[:name] = gets.chomp
print "Client age:"
hash[:age] = gets.chomp.to_i
print "Number of childreen:"
hash[:'childreen number'] = gets.chomp.to_i
print "Deccor Theme:"
hash[:'decor theme'] = gets.chomp
print "is accessibility needed? (y/n)"
hash[:accessibility] = gets.chomp == "y" ? true : false
if hash[:accessibility]
  print "accessibility needs:"
  hash[:'accessibility needs'] = gets.chomp
end

puts " "
puts "Answers:"
puts " "

def bool_to_s(bool)
  if bool.to_s == "true"
    "yes"
  elsif bool.to_s == "false"
    "No"
  else
    bool
  end
end

hash.each do |k,v|
   puts "#{k.to_s.capitalize}: #{bool_to_s(v)}"
end



