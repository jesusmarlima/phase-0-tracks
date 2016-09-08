# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  name = params[:name_start_with]
  if name
    name << '%'
    students = db.execute("SELECT * FROM students where name like ? ",name)
    result = ""
    students.each do | student |
      result << student["name"] << "<BR>"
    end
    result
  else
    students = db.execute("SELECT * FROM students")
    response = ""
    students.each do |student|
      #change method to return a student that was clicked on.
      response << "<a href='/students/#{student['id']}'>#{student['name']}</a> <br>"
      #response << "Name: #{student['name']}<br>"
      response << "Age: #{student['age']}<br>"
      response << "Campus: #{student['campus']}<br><br>"
  end
  response
  end
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    #change method to return a student that was clicked on.
    response << "<a href='/students/#{student['id']}'>#{student['name']}</a> <br>"
    #response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

get '/contact' do
  address = ""
  address << "Address: 1 Prospect Park South West<BR>"
  address << "Zip: 11215"
  address
end

get '/great_job' do
  name = params[:name]
  if name
    "Great Job, #{name}!"
  else
    "Great Job!"
  end
end

get '/:num1/add/:num2' do
  num1 = params[:num1]
  num2 = params[:num2]
  result = num1.to_i + num2.to_i
  "#{num1} + #{num2} = #{result}"
end