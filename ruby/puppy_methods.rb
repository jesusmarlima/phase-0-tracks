class Puppy
#this method runs every time we create a instance o this class. If we change the name, this method turns into a regular one.
   def initialize
    puts "Initializing new puppy instance ..."
   end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(many_times)
  many_times.times{puts "Woof!"}
  end

  def roll_over
    puts "*rolls over*"
  end

  def dog_years(age)
    age * 7
  end

  def run

  puts "I am running very fast!!!!"
  end
end

puppy = Puppy.new

puppy.fetch('ball')
puppy.speak(4)
puppy.roll_over
puppy.dog_years(2)
puppy.run

puts "\n\n\n\n\n\n\n\n\n"
class Person
 def initialize
    puts "Initializing new Person ..."
   end


 def walk
  puts "I am walking now."
 end

 def sleep
  puts " Snoring...rhrhrhrhrhr!!!"
 end

end

# maria = Person.new
# maria.walk
# maria.sleep
array = []
50.times {
  person = Person.new
  array.push(person)
}

 array.each do |one_person|
  one_person.walk
    one_person.sleep
 end