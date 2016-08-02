puts "Please type your hamsters name."
name = gets.chomp
puts "Please type in how loud your hamster gets (volume 1 -10)."
volume_level = gets.chomp.to_i
puts "Please type your hamsters fur color."
fur_color = gets.chomp
puts "Is this hamster a good canidate for adoption?"
is_canidate = gets.chomp
puts "What is hamsters age (estimate)."
age = gets.chomp

if is_canidate == "yes" || is_canidate == "y"
	is_canidate = true
else
	is_canidate = false
end


if age.empty?
	age = nil
else 
	age = age.to_i
end

puts ""
puts ""
puts ""
puts "Your hamster name is " + name 
puts ""
puts "The volume level of your hamster is " + volume_level.to_s
puts ""
puts "The color of your hamster is " + fur_color
puts ""
is_canidate = (is_canidate ? "yes" : "no") 
puts "Is your hamster a good canidate for adoption? " + is_canidate 
puts ""
if age.nil? 
   puts "You did not include age of your hamster."
else
    puts "Your hamster age is " + age.to_s
end

