class Santa

    attr_reader :age, :ethnicity, :reindeer_ranking
    attr_accessor :gender

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

    def celebrate_birthday
      @age = 1
    end

    def get_mad_at(name)
      @reindeer_ranking.push(@reindeer_ranking.delete(name))
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

#take a santa instace of array and use to test readable or writable attributes
santa_test = santas[0]

#test get_mad_at
p santa_test.reindeer_ranking
santa_test.get_mad_at("Dasher")
p santa_test.reindeer_ranking

#test celebrate_birthday
puts santa_test.age
santa_test.celebrate_birthday
puts santa_test.age

# test getter ethnicity
puts santa_test.ethnicity

# test setter gender
puts santa_test.gender
santa_test.gender = "Cis Female."
puts santa_test.gender
