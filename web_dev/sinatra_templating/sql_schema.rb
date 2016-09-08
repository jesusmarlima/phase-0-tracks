SQL_CREATE_CAMPUSES = <<-SQL
CREATE TABLE IF NOT EXISTS campuses (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255)
  )
SQL

SQL_CREATE_CAMPUSES_STUDENTS = <<-SQL
  CREATE TABLE IF NOT EXISTS campuses_students (
    id INTEGER PRIMARY KEY,
    student_id INTEGER,
    campus_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (campus_id) REFERENCES campuses(id)
  )
SQL

SQL_ALLOCATIONS = <<-SQL
    SELECT s.name student, c.name campus FROM campuses c, students s, campuses_students cs
      WHERE c.id = cs.campus_id
      AND   cs.student_id = s.id
  SQL

SQL_INSERT_STUDENTS = "INSERT INTO students (name, age) VALUES (?,?)"
SQL_SELECT_ONE_STUDENT = "SELECT * FROM students WHERE id=?"
SQL_INSERT_CAMPUS = "INSERT INTO campuses (name) VALUES (?)"
SQL_ALL_CAMPUSES = "SELECT * FROM campuses"
SQL_ALL_STUDENTS = "SELECT * FROM students"
SQL_INSERT_CAMPUS_STUDENT = "INSERT INTO campuses_students (student_id, campus_id) VALUES (?,?)"