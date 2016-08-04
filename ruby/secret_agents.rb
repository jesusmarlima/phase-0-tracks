# First thing is we need a string to encrypt
# We need some sort of loop to go though each char of the string
# We need to have an empty string to return the new message
# Need a variable to count the index of each element
# Use the next method

def encrypt(message)
  #we need an empty string so that the encrypted_message can be placed there
  encrypted_message = ""
  #used to controle the loop and acess each char
  char_index = 0
  while char_index < message.length
    #this if loop accounts for any spaces that might happen
    if message[char_index] != " "
      #using the next method to get the next character
      encrypted_message = encrypted_message + message[char_index].next[-1]
    else
      encrypted_message = encrypted_message + message[char_index]
    end
    char_index += 1
  end
  #returning the encrypted_message
  encrypted_message
end


def decrypt(message)
  decrypted_message = ""
  char_index = 0
  #storing the alphabet in a variable
  alpha = "abcdefghijklmnopqrstuvwxyz"
  while char_index < message.length
    if  message[char_index] != " "
      #getting the position of the message char in the alphabet
      position = alpha.index(message[char_index])
      #getting the previous char in the alphabet
      decrypted_message = decrypted_message + alpha[position - 1]
    else
      decrypted_message = decrypted_message + message[char_index]
    end
    char_index += 1
  end
  decrypted_message
end

# p decrypt(encrypt("swordfish"))
# p encrypt("abc")
# p encrypt("zed")
# p decrypt("bcd")
# p decrypt("afe")

#BEGIN#
p "What is your name agent?"
  name = gets.chomp
p "So agent #{name}, do you want to encrypt or decrypt a message?(d/e)"
  action = gets.chomp
p "What is your password agent #{name}?"
  password = gets.chomp
  if action.downcase == 'd' || action.downcase == 'decrypt'
    p decrypt(password)
  else
    p encrypt(password)
  end
