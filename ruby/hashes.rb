#Clear screen
#hash variable to store the keys and values
#ask user the questions and store in the hash

Gem.win_platform? ? (system "cls") : (system "clear")

hash = {}

print "Client name:"
hash[:name] = gets.chomp
print "Client age:"
hash[:age] = gets.chomp
print "Number of childreen:"
hash[:child_number] = gets.chomp
print "Deccor Theme:"
hash[:decor_theme] = gets.chomp
print "is accessibility needed? (y/n)"
hash[:accessibility] = gets.chomp
if hash[:accessibility] == "y"
  print "accessibility needs:"
  hash[:accessibility_kind] = gets.chomp
end




