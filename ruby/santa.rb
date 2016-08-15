class Santa

    attr_reader :ethnicity, :reindeer_ranking
    attr_accessor :gender, :age

    def initialize(gender,ethnicity)
      @gender = gender
      @ethnicity = ethnicity
      @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
      @age = 0
      puts "\ninitializing Santa instance..."
    end

    def speak
      puts "Ho, Ho, Ho, Haaaaaappy holidays!"
    end

    def eat_milk_and_cookies(cookie_type)
      puts "Thats was a good #{cookie_type} here!"
    end

    def celebrate_birthday
      @age = 1
    end

    def get_mad_at(name)
      @reindeer_ranking.push(@reindeer_ranking.delete(name))
    end

end

# # santa = Santa.new
# # santa.eat_milk_and_cookies("crakers")
# # santa.speak

# santas = []

# example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
# example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]

# #sorting genders array by alphabet
# example_genders.sort!
# #sorting ethnicities array by alphabet revesed
# example_ethnicities.sort!{|a , b| b <=> a}

# #initializing with gender and ethnicities mixed
# example_genders.each_with_index do |gender,index|
#   santas << Santa.new(gender,example_ethnicities[index])
# end

# puts " ---------------------------------------------------- "
# #sorting ethnicities array by third letter.
# example_genders.sort!{|a , b| b[2] <=> a[2]}
# #sorting genders array by alphabet
# example_ethnicities.sort!

# #initializing with gender and ethnicities mixed
# example_genders.each_with_index do |gender,index|
#   santas << Santa.new(gender,example_ethnicities[index])
# end

# #take a santa instace of array and use to test readable or writable attributes
# santa_test = santas[0]

# #test get_mad_at
# p santa_test.reindeer_ranking
# santa_test.get_mad_at("Dasher")
# p santa_test.reindeer_ranking

# #test celebrate_birthday
# puts santa_test.age
# santa_test.celebrate_birthday
# puts santa_test.age

# # test getter ethnicity
# puts santa_test.ethnicity

# # test setter gender
# puts santa_test.gender
# santa_test.gender = "Cis Female."
# puts santa_test.gender

facebook_genders =
['Agender','Androgyne','Androgynous','Bigender','Cis','Cisgender','Cis Female',
 'Cis Male','Cis Man','Cis Woman','Cisgender Female','Cisgender Male','Cisgender Man',
 'Cisgender Woman','Female to Male','FTM','Gender Fluid','Gender Nonconforming',
 'Gender Questioning','Gender Variant','Genderqueer','Intersex','Male to Female','MTF',
 'Neither','Neutrois','Non-binary','Other','Pangender','Trans','Trans Female',
 'Trans Male','Trans Man','Trans Person','Trans Woman','Transfeminine','Transgender',
 'Transgender Female','Transgender Male','Transgender Man','Transgender Person',
 'Transgender Woman','Transmasculine','Transsexual','Transsexual Female','Transsexual Male',
 'Transsexual Man','Transsexual Person','Transsexual Woman','Two-Spirit']

reindeer = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]

example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A", "arabic", "Mongol", "Celtic"]

cookie_types = ['Bath Oliver', 'Biscotti' ,'Bredela', 'Charcoal biscuit',
  'Fig roll','Gingerbread','Ricciarelli', 'alfajor']

 santas = []
 200.times{
   santa = Santa.new(facebook_genders.sample,example_ethnicities.sample)
   santa.age = rand(141)
   santa.get_mad_at(reindeer.sample)
   santas << santa
 }

 puts "\n Here is all 200 santas to holidays this year\n"
 santas.each_with_index do |santa,index|
    puts "Santa #{index + 1}\n"
    puts "Ethnicity: #{santa.ethnicity}, gender: #{santa.gender}, age: #{santa.age}"
    santa.speak
    santa.eat_milk_and_cookies(cookie_types.sample)
    puts "Rindeer_ranking: #{santa.reindeer_ranking.to_s} \n "

 end
