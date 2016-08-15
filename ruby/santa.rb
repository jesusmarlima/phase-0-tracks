class Santa

def initialize
  puts "\ninitializing Santa instance..."
end

def speak
  puts "\nHo, Ho, Ho, Haaaaaappy holidays!"
end

def eat_milk_and_cookies(cookie_type)
  puts "\nThats was a good #{cookie_type} here!"
end

end

santa = Santa.new

santa.eat_milk_and_cookies("crakers")

santa.speak