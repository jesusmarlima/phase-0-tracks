module Helper

    #this method return a letter or letters to compose the apartment number
    # in: index to find the letter
    # out:  the letter of the alphabet that index match, if the index is out of bounds, I am using the next method in the 'Z' char so 'AA',AB...
    def self.getLetter(number)
     letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
     last_letter = letters[-1]
     if number < 25
        return letters[number]
     else
        times_to_next = number - 25
        times_to_next.times{
          last_letter = last_letter.next
        }
     end
     last_letter
  end

  # this method formats what is printing '| 1A |' because if the apartment # has two numbers or two letters the building turn unaligned
  # there is a limit to stay align = 6.
  def self.format(apartment)
    begin_str = " |"
    end_str = "| "
    result = begin_str + apartment.number.center(6," ") + end_str
  end


end