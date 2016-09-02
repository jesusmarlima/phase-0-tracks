require_relative 'sql_constants'

class Apartment

  attr_accessor :rented, :number_of_beds
  attr_reader :id, :number, :building_id

  def initialize(id,number,rented,number_of_beds,building_id,db)
        @number = number
        @rented = rented
        @number_of_beds = number_of_beds
        @building_id = building_id
        @db = db
        if id
          @id = id
        end
  end

  def create
    @db.execute(SQL_INSERT_APARTMENT,[@number,@rented,@number_of_beds,@building_id]);
    @id = @db.last_insert_row_id
    self
  end

  def to_s
    @number
  end

  def clear(*to_delete)
    @db.execute(SQL_CLEAR_TESTS_APARTMENT,self.id)
  end

  def rent_apartment
    if @rented == "true"
        @db.execute(SQL_UPDATE_APARTMENT, "false", self.id)
    else
        @db.execute(SQL_UPDATE_APARTMENT, "true", self.id)
    end
  end

end