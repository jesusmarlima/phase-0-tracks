p "How many employees will be processed ? "
number_of_employees = gets.chomp().to_i
times = 0

while times < number_of_employees do
    p "What is your name ? "
    name = gets.chomp()
    p "How old are you ? "
    age = gets.chomp()
    p "what year were you born ? "
    year_born = gets.chomp()
    p "Our company cafeteria serves garlic bread. Should we order some for you? "
    eat_garlic_bread = gets.chomp().do == "yes" ? true : false
    p "Would you like to enroll in the company’s health insurance?"
    want_health_insurance = gets.chomp().downcase == "yes" ? true : false
    age_ok = (age.to_i + year_born.to_i) == 2016

    allergy = ""
    until allergy.downcase == "done" do
      p "name any allergies to you have:"
      allergy = gets.chomp
      break if allergy == "sunshine"
    end

    if allergy == "sunshine"
      puts "Probably a vampire."
    elsif age_ok && ( eat_garlic_bread || want_health_insurance )
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

    times += 1
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
