#Clear screen
#hash variable to store the keys and values
#ask user the questions and store in the hash

#convert variables to the right type

Gem.win_platform? ? (system "cls") : (system "clear")

hash = {}

print "Client name:"
hash[:name] = gets.chomp
print "Client age:"
hash[:age] = gets.chomp.to_i
print "Number of childreen:"
hash[:child_number] = gets.chomp.to_i
print "Deccor Theme:"
hash[:decor_theme] = gets.chomp
print "is accessibility needed? (y/n)"
hash[:accessibility] = gets.chomp == "y" ? true : false
if hash[:accessibility]
  print "accessibility needs:"
  hash[:accessibility_kind] = gets.chomp
end




