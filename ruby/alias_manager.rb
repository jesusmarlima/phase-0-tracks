# given a full name
# store full in the variable
# split the string into array
# revert the array
# join in a string again
# new string is needed to store the new values
# "aeiou" string is needed to know if each char of the array of strings is vowel or consonants
# loop into the each char of the string
# ask if is vowel
# if is true get next element of vowels
# if is consonant get next consonant
# print the consonant at the end

# clear screen
def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
end

#this method return the next vowel
def get_next_vowel(vowel,vowels)
  next_vowel = vowel
  loop do
    next_vowel = next_vowel.next
    break if vowels.include?(next_vowel[-1])
  end
  next_vowel[-1]
end

#this method return the next consonant
def get_next_consonant(consonant,vowels)
   next_consonant = consonant
  loop do
    next_consonant = next_consonant.next
    break if !vowels.include?(next_consonant[-1])
  end
  next_consonant[-1]
end

#this method return id char is down or uppcase
def is_upcase?(char)
  downcased_char = char.downcase
  downcased_char != char
end

#this method return next char of vowel or consonant, and space if the char is space
def next_char(char)
  #if the char is capitalized we have to ask for uppercased vowels
  vowels = is_upcase?(char) ? "AEIOU" : "aeiou"
  if char == " "
      char
  elsif vowels.include?(char)
      get_next_vowel(char,vowels)
  else
      get_next_consonant(char,vowels)
  end
end

# this method invert the agent name
def invert_names(agent_name)
  inverted_names = []
  agent_name.split(" ").each do |name|
    inverted_names.unshift(name)
  end
  inverted_names.join(" ")
end

#this method do what is asked (main method)
def alias_to(agent_name)
  #inverting names
  inverted_names = invert_names(agent_name)
  agent_alias = ""
  #for each char of the inverted names change to the next char if necessary
  inverted_names.chars.each do |char|
      agent_alias << next_char(char)
  end
  agent_alias
end


#tests

# puts alias_to("Marco Aurelio") == "Easimou Nesdu"
# puts alias_to("Jesusmar Lima") == "Mone Kitatnes"
# puts alias_to("JeSuSmar PeReIra LimA") == "MonE QiSiOse KiTaTnes"
# puts alias_to("JeSuSmar PeReIra LimA FilHO") == "GomJU MonE QiSiOse KiTaTnes"



# puts get_next_vowel("a","aeiou") == "e"
# puts get_next_vowel("e","aeiou") == "i"
# puts get_next_vowel("u","aeiou") == "a"

# puts get_next_consonant("b","aeiou") == "c"
# puts get_next_consonant("d","aeiou") == "f"
# puts get_next_consonant("x","aeiou") == "y"
# puts get_next_consonant("z","aeiou") == "b"


#-------------BEGIN PROGRAM------------------------------

clear_screen
loop do
  puts " "
  print "Dear mr(s) agent, please type your full name or 'quit' to exit :"
  full_name = gets.chomp
  break if full_name == "quit"
  puts " "
  print "Mr(s) #{full_name} your alias is: #{alias_to(full_name)}"
  puts " "
end