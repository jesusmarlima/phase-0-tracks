module Shout

  # def self.yell_angrily(words)
  #   words + "!!!" + " :("
  # end

  # def self.yelling_happily(words)
  #   words + "!!!!" + " :DDDD"
  # end

  def yell_angrily(words)
    yield
    words + "!!!" + " :("
  end

  def yelling_happily(words)
    yield
    words + "!!!!" + " :DDDD"
  end



end

# puts Shout.yelling_happily("testando o modulo")
# puts Shout.yell_angrily("testando o modulo")


class Woman
  include Shout
end

class Man
  include Shout
end

class Child
  include Shout
end

#driver code

woman = Woman.new
man = Man.new
child = Child.new

puts woman.yelling_happily("lets code!!!") {puts woman.class }
puts man.yelling_happily("lets go to the bar!!!") {puts man.class}
puts child.yelling_happily("lets play!!!") {puts child.class }

puts child.yell_angrily("I don't want sleep") {puts child.class }
puts man.yell_angrily("Crap, I forgot my cellphone at home") {puts man.class }
puts woman.yell_angrily("haaaa, I tore my pantyhose") {puts woman.class }