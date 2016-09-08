# require gems
require 'sinatra'
require 'sqlite3'
require_relative 'sql_schema'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.execute(SQL_CREATE_CAMPUSES)
db.execute(SQL_CREATE_CAMPUSES_STUDENTS)
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute(SQL_ALL_STUDENTS)
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute(SQL_INSERT_STUDENTS, [params['name'], params['age'].to_i])
  redirect '/'
end

# create new page to link to students by id and show name
get '/students/student_link' do
  @students = db.execute(SQL_ALL_STUDENTS)
  erb :student_link
end

#create new page to link individual student details
get '/students/:id' do
  @student = db.execute(SQL_SELECT_ONE_STUDENT, params[:id].to_i)[0]
  puts @student
  erb :student_details
end

#create new route for new campus

get '/campus/new' do
  erb :new_campus
end

#insert new campus into campuses table
post '/campus' do
  db.execute(SQL_INSERT_CAMPUS, [params['name']])
  redirect '/campuses'
end

#send campuses data to campuses.erb
get '/campuses' do
  @campuses = db.execute(SQL_ALL_CAMPUSES)
  erb :campuses
end

#create relation between students and campuses
get '/campus_student/new' do
  @campuses = db.execute(SQL_ALL_CAMPUSES)
  @students = db.execute(SQL_ALL_STUDENTS)
  erb :new_campus_student
end

post '/campus_student' do
  student = params[:students].to_i
  campus = params[:campuses].to_i
  db.execute(SQL_INSERT_CAMPUS_STUDENT, student, campus)
  redirect "/"
end

#get route from campuses_students called allocations
get '/allocations' do
  @allocations = db.execute(SQL_ALLOCATIONS)
  erb :allocations
end