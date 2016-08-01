p "What is your name ? "
name = gets.chomp()
p "How old are you ? "
age = gets.chomp()
p "what year were you born ? "
year_born = gets.chomp()
p "Our company cafeteria serves garlic bread. Should we order some for you? "
eat_garlic_bread = gets.chomp() == "yes" ? true : false
p "Would you like to enroll in the company’s health insurance?"
want_health_insurance = gets.chomp() == "yes" ? true : false
age_ok = (age.to_i + year_born.to_i) == 2016

if age_ok && ( eat_garlic_bread || want_health_insurance )
  puts "probably not a vampire"
elsif !age_ok && (( !eat_garlic_bread && want_health_insurance ) || (                          eat_garlic_bread && !want_health_insurance ))
  puts "Probably a vapire"
elsif !age_ok && !eat_garlic_bread && !want_health_insurance
  puts "Almost certainly a vapire."
elsif name == "Drake Cula" || name == "Tu Fang"
  puts "Definitely a vampire"
else
  puts "Results inconclusive."
end
