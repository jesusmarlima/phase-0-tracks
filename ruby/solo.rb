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

      attr_accessor :games_playeds, :gols_amount, :salary
      attr_reader :name, :sex, :age

      def initialize( name, sex , age)
        @name = name
        @sex = sex
        @gols_amount = 0
        @salary = 0.0
        @games_playeds = 0
        @age = age
      end

      def to_s
        @name
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

      def celebrate
        run
        @gols_amount += 1
        puts " goooooooooooollllllllll!!!!!!!!!!!!!"

      end



end


#tests
puts "--------------- tests-------------------"
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


puts "----------------end tests-------------------"


# Program methods

#clear screen
def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
end


#begin program

print "Press <enter> to continue:"
gets.chomp


players = []
clear_screen
puts "Make a list of your favotire soccer players:"
total_amount = 0
loop do
    print " \nPlease type a name for your player or done to finish the program: "
    name = gets.chomp
    break if name == "done"
    print " Type the sex (F,M) of your player: "
    sex = gets.chomp
    print " Please type the age of the player: "
    age = gets.chomp.to_i
    player = Soccer_Player.new(name,sex,age)
    print " How much you want to pay for #{player.name} to play in your team: "
    player.salary = gets.chomp.to_f
    total_amount += player.salary
    players << player
end


puts "\n There is your team:"
players.each do |player|
  puts "Player: #{player.name}  sex: #{player.sex == 'F' ? 'Female' : 'Male'}  age: #{player.age} Salary: #{player.salary}"
end

puts "total to spent to make the team :#{total_amount}"

puts "Thanks for make you team!"





