def print_header                                          # Print title
  puts "The students of Villains Academy"
  puts "--------------------------------\n"
end

def print(names)                                          # Print names of Students & Cohort
  names.each { |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  }
end

def print_footer(names)                                   # Print the total of students
  puts "\nOverall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the name of the student\nTo finish, just hit return twice"
  name = gets.chomp
  students = []                                           # Create array for future data
  while !name.empty?
    students << {name: name, cohort: :november}           # Store the student hash to the Array 
    puts "Now we have #{students.count}"
    name = gets.chomp
  end
  students
end

students = input_students
print_header                                              # Call the methods
print(students)
print_footer(students)