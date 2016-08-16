# class soocer player

# CHARACTERISTICS ----------------
# name: varies
# age varies
# salary: number
# number of games played
# gols amount
# sex

# BEHAVIOR -----------------------
# run
# shoot
# pass
# celebrate gols

class Soccer_Player

attr_accessor :name, :age, :games_playeds, :gols_amount
attr_reader :sex, :salary

def initialize( name, sex , age)
  @name = name
  @sex = sex
  @gols_amount = 0
  @salary = 0.0
  @games_playeds = 0
  @age = age
end

def play
  puts "#{@name} is playing  now"
  @games_playeds += 1
end

def run
  puts "#{@name} is running now"
end

def shoot
   puts "#{@name} is shooting and!?!?!"
end

def change_sex(new_sex)
  @sex = new_sex
end

def set_salary(amount)
  salary = amount
end

def celebrate
  run
  @gols_amount += 1
  puts " goooooooooooollllllllll!!!!!!!!!!!!!"

end

end


#tests

player = Soccer_Player.new("marta","F",30)

puts "player.name should be marta : #{player.name == 'marta'}"
puts "player.sex should be 'F' : #{player.sex == 'F'}"
puts "player.age should be 30 : #{player.age == 30} "
puts "player.gols_amount sould be 0 : #{player.gols_amount == 0}"
puts "player.games_playeds sould be 0 #{player.games_playeds == 0}"

# player methods tests
puts "---------------------"

puts "player.games_playeds sould be 0  #{player.games_playeds == 0}"
player.play
puts "player.games_playeds  shoud + 1  #{player.games_playeds == 1}"


player.run
player.shoot
player.celebrate
puts "player.gols_amount sould be + 1 : #{player.gols_amount == 1}"
