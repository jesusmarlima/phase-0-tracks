module Shout

  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily(words)
    words + "!!!!" + " :DDDD"
  end

end

puts Shout.yelling_happily("testando o modulo")
puts Shout.yell_angrily("testando o modulo")
