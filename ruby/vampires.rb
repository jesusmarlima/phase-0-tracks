print "How many employees will be processed ? "
number_of_employees = gets.chomp().to_i
times = 0

while times < number_of_employees do
    puts " "
    print "What is your name ?   "
    name = gets.chomp()
    print "How old are you ?   "
    age = gets.chomp()
    print "what year were you born ?   "
    year_born = gets.chomp()
    print "Our company cafeteria serves garlic bread. Should we order some for you?   "
    eat_garlic_bread = gets.chomp().downcase == "yes" ? true : false
    print "Would you like to enroll in the company’s health insurance?   "
    want_health_insurance = gets.chomp().downcase == "yes" ? true : false
    age_ok = (age.to_i + year_born.to_i) == 2016

    allergy = ""
    while allergy.downcase != "done" do
      print "name any allergies to you have:"
      allergy = gets.chomp
      break if allergy == "sunshine"
    end

    if allergy == "sunshine"
      puts "Probably a vampire."
      next
    end

    puts " "
    message = ""


    if age_ok && ( eat_garlic_bread || want_health_insurance )
      message = "probably not a vampire"
    elsif !age_ok && ( !eat_garlic_bread ^ !want_health_insurance )
      message = "Probably a vapire"
    elsif !age_ok && !eat_garlic_bread && !want_health_insurance
      message = "Almost certainly a vapire."
    else
      message = "Results inconclusive."
    end

    if name == "Drake Cula" || name == "Tu Fang"
      message = "Definitely a vampire"
    end

    puts message

    times += 1
end
puts " "
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
