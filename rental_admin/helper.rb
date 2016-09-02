module Helper

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

  def self.format(apartment)
    leng = apartment.number.length
    if leng == 2
      " |  #{apartment}  | "
    elsif leng == 3
      " | #{apartment}  | "
    else
      " |#{apartment}  | "
    end
  end


end