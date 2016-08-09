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

def next_char(char)
  vowels = "aeiou"
  if char == " "
      char
  elsif vowels.include?(char)
      get_next_vowel(char)
  else
      get_next_consonat(char)
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
puts alias_to("marco aurelio")




