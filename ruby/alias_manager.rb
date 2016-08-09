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

def get_next_vowel(vowel,vowels)
  next_vowel = vowel
  loop do
    next_vowel = next_vowel.next
    break if vowels.include?(next_vowel[-1])
  end
  next_vowel[-1]
end

def get_next_consonant(consonant,vowels)
   next_consonant = consonant
  loop do
    next_consonant = next_consonant.next
    break if !vowels.include?(next_consonant[-1])
  end
  next_consonant[-1]
end

def is_capitalized?(char)
  downcased_char = char.downcase
  downcased_char != char
end

def next_char(char)
  vowels = is_capitalized?(char) ? "AEIOU" : "aeiou"
  if char == " "
      char
  elsif vowels.include?(char)
      get_next_vowel(char,vowels)
  else
      get_next_consonant(char,vowels)
  end
end

def alias_to(agent_name)
  names = agent_name.split(" ")
  names[0],names[1] = names[1],names[0]
  inverted_names = names.join(" ")
  agent_alias = ""
  inverted_names.chars.each do |char|
      agent_alias << next_char(char)
  end
  agent_alias
end

# puts alias_to("Marco Aurelio") == "Easimou Nesdu"
# puts alias_to("Jesusmar Lima") == "Mone Kitatnes"


#tests

# puts get_next_vowel("a","aeiou") == "e"
# puts get_next_vowel("e","aeiou") == "i"
# puts get_next_vowel("u","aeiou") == "a"

# puts get_next_consonant("b","aeiou") == "c"
# puts get_next_consonant("d","aeiou") == "f"
# puts get_next_consonant("x","aeiou") == "y"
# puts get_next_consonant("z","aeiou") == "b"
