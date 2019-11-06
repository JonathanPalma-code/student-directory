def print_header # Print title
  puts "The students of Villains Academy".center(150)
end

def print(details) # Print names of Students & Cohort
  student_number = 1
  details.each { |student|
    puts "\n#{student_number}. #{student[:name]}\nDate of birth: #{student[:date]}\n(#{student[:cohort]} cohort)\n"
    student_number += 1
  }
end

def print_footer(names) # Print the total of students
  puts "Overall, we have #{names.count} great students".center(150)
end

def date_validation # Date of birth valid?
  puts "Date of birth (DD-MM-YYYY)"
  @date = gets.chomp
  until /(\d{2}-\d{2}-\d{4})/.match(@date)
    puts "Incorrect format, please try again"
    @date = gets.chomp
  end
end

def input_students # Store the details of the students 
  puts "Please enter the name of the student"
  name = gets.chomp
  puts "and his cohort"
  month = gets.chomp.downcase
  students = [] # Create array for future data
  while !name.empty? 
    date_validation
    students << {name: name, date: @date, cohort: "november"} if month.length == 0
    students << {name: name, date: @date, cohort: month} if month.length > 0
    puts "Total of number of students is: #{students.count}".center(150)
    puts "\n(To insert more Students please enter a name. To finish, just hit return twice)."
    name = gets.chomp
    if name.length > 0
      puts "and his cohort"
      month = gets.chomp.downcase
    end
  end
  students
end

students = input_students
print_header               # Call ALL the methods
print(students)
print_footer(students)