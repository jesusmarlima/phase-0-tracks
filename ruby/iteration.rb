# this method just print the names of the students and the last name on the block that is passed.
def print_names
  last_name = "Zambrano"
  print "Jesus"
  yield (last_name)
  last_name = "Lima"
  print "Jesusmar"
  yield (last_name)
end

print_names { |last_name| puts " last name is #{last_name}" }