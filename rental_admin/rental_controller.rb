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

class Rental_controller
  attr_reader :db


  def initialize
    # create database if not exits and assign to db instace variable
    @db = SQLite3::Database.new("rental.db")
  end

  # this method is called at the begin of the program to create the tables
  # in case that is the first time.

  def initial_setup
    @db.execute(SQL_BUILDING_TABLE)
    @db.execute(SQL_APARTMENTS_TABLE)
  end

  # this method Istantiate a building object and persist into database
  def insert_building (id,name,floors,apts_by_floor)
    building = Building.new(id,name, floors, apts_by_floor, @db)
    building.create
  end

  # this method Istantiate a apartment object and persist into database
  def insert_apartments (number,rented,number_of_beds,building_id)
    apartment = Apartment.new(nil,number,rented,number_of_beds,building_id,@db)
    apartment.create
  end

  # this method creates a entire building and its apartments
  def create_building(id,name,floors,apts_by_floor)
    building = insert_building(id,name,floors,apts_by_floor)
    create_apartments(floors,apts_by_floor,building.id)
    building

  end

  # this method create all apartments od a building when the building id is  passed
  def create_apartments(floors,apts_by_floor,building_id)
    apartments = []
    floors.times do |floor|
      apts_by_floor.times do |block|
        number = (floor + 1).to_s + Helper.getLetter(block)
        #all apartments are created with 2 beds and Avalibable
        apartments << insert_apartments(number,'false',2,building_id)
      end
    end
    apartments
  end

  # this method returns all buildings in the database
  def buildings
    result_set = @db.execute(SQL_ALL_BUILDINGS)
    buildings = []
    result_set.each do |building|
      building = Building.new(building[0],building[1],building[2],building[3],@db)
      buildings << building
    end
    buildings
  end

  #this method prints a entire building.
  #in buildind
  #out : this squares below, [availabe or rented]
  # ------   -------
  #|  1A  | |  2A  |
  #|      | |rented|
  # ------   -------
  def print_building(building)
    ceiling = " -------- "
    building.all_apartments_in_floors.each do |all_apartments_in_one_floor|
      print ceiling * building.apts_by_floor
      print "\n"
      all_apartments_in_one_floor.each do |apartment|
          print Helper.format(apartment)
      end
      print "\n"
      all_apartments_in_one_floor.each do |apartment|
        if apartment.rented == "true"
          print " |rented| "
        else
          print " |      | "
        end
      end



      print "\n"
      print ceiling * building.apts_by_floor
      print "\n"
    end

  end

end





