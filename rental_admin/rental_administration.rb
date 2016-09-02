# this is a rental administration program
# features:
# Create a Building rental (number os floors and number of aparts by floor)
# all aparts will be available for rent at first
# rent registration
# rent available view
# view building status (all apartments and theirs status)
#-----------------------------------------------------------

require 'sqlite3'

require_relative 'sql_constants'
require_relative 'building'
require_relative 'apartment'
require_relative 'helper'

class Rental_builder
  attr_reader :db


  def initialize
    @db = SQLite3::Database.new("rental.db")
  end

  def initial_setup
    @db.execute(SQL_BUILDING_TABLE)
    @db.execute(SQL_APARTMENTS_TABLE)
  end

  def insert_building (id,name,floors,apts_by_floor)
    building = Building.new(id,name, floors, apts_by_floor, @db)
    building.create
  end

  def insert_apartments (number,rented,number_of_beds,building_id)
    apartment = Apartment.new(nil,number,rented,number_of_beds,building_id,@db)
    apartment.create
  end

  def create_building(id,name,floors,apts_by_floor)
    building = insert_building(id,name,floors,apts_by_floor)
    create_apartments(floors,apts_by_floor,building.id)
    building

  end

  def create_apartments(floors,apts_by_floor,building_id)
    apartments = []
    floors.times do |floor|
      apts_by_floor.times do |block|
        number = (floor + 1).to_s + Helper.getLetter(block)
        apartments << insert_apartments(number,'false',2,building_id)
      end
    end
    apartments
  end

  def buildings
    result_set = @db.execute(SQL_ALL_BUILDINGS)
    buildings = []
    result_set.each do |building|
      building = Building.new(building[0],building[1],building[2],building[3],@db)
      buildings << building
    end
    buildings
  end

  def print_building(building)
    ceiling = " -------- "
    building.all_apartments_in_floors.each do |all_apartments_in_one_floor|
      print ceiling * building.apts_by_floor
      print "\n"
      all_apartments_in_one_floor.each do |apartment|
        if apartment.rented == "true"
          print " |rented| "
        else
          print Helper.format(apartment)
        end
      end
      print "\n"
      print ceiling * building.apts_by_floor
      print "\n"
    end

  end

end





