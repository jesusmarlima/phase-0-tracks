class Santa

def initialize(gender,ethnicity)
  @gender = gender
  @ethnicity = ethnicity
  @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
  @age = 0
  puts "\ninitializing Santa instance..."
end

def speak
  puts "\nHo, Ho, Ho, Haaaaaappy holidays!"
end

def eat_milk_and_cookies(cookie_type)
  puts "\nThats was a good #{cookie_type} here!"
end

end

# santa = Santa.new
# santa.eat_milk_and_cookies("crakers")
# santa.speak

santas = []

example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]

#sorting genders array by alphabet
example_genders.sort!
#sorting ethnicities array by alphabet revesed
example_ethnicities.sort!{|a , b| b <=> a}

#initializing with gender and ethnicities mixed
example_genders.each_with_index do |gender,index|
  santas << Santa.new(gender,example_ethnicities[index])
end

puts " ---------------------------------------------------- "
#sorting ethnicities array by third letter.
example_genders.sort!{|a , b| b[2] <=> a[2]}
#sorting genders array by alphabet
example_ethnicities.sort!

#initializing with gender and ethnicities mixed
example_genders.each_with_index do |gender,index|
  santas << Santa.new(gender,example_ethnicities[index])
end
