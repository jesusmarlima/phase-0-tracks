require_relative 'sql_constants'

class Building

  attr_accessor :name, :floors, :apts_by_floor
  attr_reader :id,:db

  def initialize(id, name, floors, apts_by_floor, db)
    @name = name
    @floors = floors
    @apts_by_floor = apts_by_floor
    @db = db
    if id
      @id = id
    end
  end

  def create
      @db.execute(SQL_INSERT_BUILDING,[@name,@floors,@apts_by_floor]);
      @id = @db.last_insert_row_id
      self
  end

  def clear
     @db.execute(SQL_CLEAR_TESTS_BUILDING_APARTMENTS,self.id)
     @db.execute(SQL_CLEAR_TESTS_BUILDING,self.id)
  end

  def to_s
    @name
  end

  def apartments
    apartments_result_set = @db.execute(SQL_SELECT_APARTMENTS_FROM_BUILDING,@id)
    apartments = []
    apartments_result_set.each do |apart|
      apartament = Apartment.new(apart[0], apart[1] , apart[2], apart[3] ,  @id, @db)
      apartments << apartament
    end
    apartments
  end

  def all_apartments_in_floors
    floors = []
    apartments_by_floor = self.apartments.each_slice(self.apts_by_floor)
    (self.floors).downto(1).each do |floor_number|
      apartments_in_floor = apartments_by_floor.entries[floor_number - 1]
      floors << apartments_in_floor.map{|apt| apt}
    end
    floors
  end
end