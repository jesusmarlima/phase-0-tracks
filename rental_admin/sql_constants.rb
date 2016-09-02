# In this file is all SQL used in program

    SQL_UPDATE_APARTMENT = <<-SQL
      UPDATE apartments set rented = ? where id = ?
    SQL

    SQL_ALL_BUILDINGS = <<-SQL
        SELECT id,name,number_of_floors,number_apt_by_foor  FROM buildings
    SQL

    SQL_CLEAR_TESTS_APARTMENT = <<-SQL
        DELETE FROM apartments where id = ?
    SQL

    SQL_CLEAR_TESTS_BUILDING_APARTMENTS = <<-SQL
        DELETE FROM apartments where building_id = ?;
    SQL

    SQL_CLEAR_TESTS_BUILDING = <<-SQL
        DELETE FROM buildings where id = ?
    SQL

    SQL_INSERT_BUILDING = <<-SQL
      INSERT INTO buildings (name,number_of_floors,number_apt_by_foor) VALUES
      (?,?,?)
    SQL

    SQL_INSERT_APARTMENT = <<-SQL
      INSERT INTO apartments (number,rented,number_of_beds,building_id) VALUES
      (?,?,?,?)
    SQL

    SQL_SELECT_APARTMENTS_FROM_BUILDING = <<-SQL
      SELECT a.id, a.number, a.rented, a.number_of_beds FROM apartments a JOIN buildings b on a.building_id = b.id WHERE b.id = ?
      SQL

    SQL_BUILDING_TABLE = <<-SQL
      CREATE TABLE IF NOT EXISTS buildings (id INTEGER PRIMARY KEY,
        name VARCHAR(255),
        number_of_floors INT,
        number_apt_by_foor INT
        )
    SQL

    SQL_APARTMENTS_TABLE = <<-SQL
      CREATE TABLE IF NOT EXISTS apartments (id INTEGER PRIMARY KEY,
        number VARCHAR(2),
        rented BOOLEAN,
        number_of_beds INT,
        building_id INTEGER,
        FOREIGN KEY (building_id) REFERENCES buildings (id)
        )
    SQL