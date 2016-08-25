# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
#
#
require_relative 'state_data'

class VirusPredictor

  # Create the instance of the VirusPredictor
  # Configures the state of the object
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # Calls on two other methods
  def virus_effects
      puts "#{@state} will lose #{predicted_deaths} people in this outbreak and will spread across the state in #{speed_of_spread} months.\n\n"
  end

  # Prints information about the spread of disease
  private
  # Cannot access methods, only from inside the class

  # Calculates and prints number of deaths in the state
  def predicted_deaths
    # predicted deaths is solely based on population density

    factors = {200 => 0.4, 150 => 0.3, 100 => 0.2, 50 => 0.1 , 0 => 0.05 }

    # another way to get the factor to multiplay with Population

    factor = factors.select{|population_density, factor| population_density <= @population_density }.values.first
    return (@population * factor).floor

  end

  # Calculates and prints speed of spread
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    # another way to get the factor to return the corret speed
    factors = {200 => 0.5, 150 => 1, 100 => 1.5, 50 => 2 , 0 => 2.5 }
    speed = factors.select{|population_density, speed| population_density <= @population_density }.values.first

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |state, population_info|
  state_info = VirusPredictor.new(state, population_info[:population_density], population_info[:population])
  state_info.virus_effects
end


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


#=======================================================================
# Reflection Section