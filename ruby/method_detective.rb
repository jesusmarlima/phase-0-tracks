# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.


# Clear screen
Gem.win_platform? ? (system "cls") : (system "clear")


puts"'iNvEsTiGaTiOn'.swapcase == 'InVeStIgAtIoN': #{'iNvEsTiGaTiOn'.swapcase == 'InVeStIgAtIoN'}"
# => “InVeStIgAtIoN”

puts""

puts"'zom'.insert(1,'o') == 'zoom' : #{'zom'.insert(1,'o') == 'zoom'}"
puts"'zom'.gsub('o','oo') == 'zoom': #{'zom'.gsub('o','oo') == 'zoom'}"
puts"'zom'.sub('o','oo') == 'zoom' : #{'zom'.sub('o','oo') == 'zoom'}"
# => “zoom”

puts""


puts"'enhance'.center(15) == '    enhance    ' : #{'enhance'.center(15) == '    enhance    '}"
puts"'enhance'.rjust(11).ljust(15) == '    enhance    ' : #{'enhance'.rjust(11).ljust(15) == '    enhance    '}"
# => '    enhance    '

puts ""

puts"'Stop! You’re under arrest!'.upcase == 'STOP! YOU’RE UNDER ARREST!' : #{'Stop! You’re under arrest!'.upcase == 'STOP! YOU’RE UNDER ARREST!'}"
# => 'STOP! YOU’RE UNDER ARREST!'

puts""

puts"'the usual'.concat(' suspects') == 'the usual suspects' : #{'the usual'.concat(' suspects') =='the usual suspects'}"
#=> 'the usual suspects'

puts""

puts"' suspects'.gsub(' ', 'the usual ') == 'the usual suspects' : #{' suspects'.gsub(' ', 'the usual ') == 'the usual suspects'}"

puts"' suspects'.sub(' ', 'the usual ') == 'the usual suspects' : #{' suspects'.sub(' ', 'the usual ') == 'the usual suspects'}"

puts"' suspects'.rjust(18,'the usual') == 'the usual suspects' : #{' suspects'.rjust(18,'the usual') == 'the usual suspects'}"
# => 'the usual suspects'

puts " "

puts"'The case of the disappearing last letter'.chop == 'The case of the disappearing last lette' : #{'The case of the disappearing last letter'.chop == 'The case of the disappearing last lette'} "
# => 'The case of the disappearing last lette'

puts" "

puts"'The mystery of the missing first letter'.slice(1..-1) == 'he mystery of the missing first letter' : #{'The mystery of the missing first letter'.slice(1..-1) == 'he mystery of the missing first letter'}"
# => 'he mystery of the missing first letter'

puts" "

puts"'Elementary,    my   dear        Watson!'.squeeze(' ') == 'Elementary, my dear Watson!' : #{'Elementary,    my   dear        Watson!'.squeeze(' ') == 'Elementary, my dear Watson!'}"
# => 'Elementary, my dear Watson!'

puts" "

puts"'z'.ord == 122 : #{'z'.ord == 122 }"
# => 122
# (What is the significance of the number 122 in relation to the character z?)
puts " 122 is the value of this letter in ASCII table "

puts " "

puts"'How many times does the letter <a> appear in this string?'.count('a')  == 4 : #{'How many times does the letter <a> appear in this string?'.count('a')  == 4}"
# => 4