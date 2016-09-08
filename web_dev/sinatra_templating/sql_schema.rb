
SQL_CREATE_CAMPUSES <<-SQL
CREATE TABLE IF NOT EXISTS campuses (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255)
  )
SQL

SQL_CREATE_CAMPUSES_STUDENTS <<-SQL
  CREATE TABLE IF NOT EXISTS campuses_students (
    id INTEGER PRIMARY KEY,
    student_id INTEGER,
    campus_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (campus_id) REFERENCES campuses(id)
  )
SQL

