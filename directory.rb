  
def find_most_similar
  puts "and his cohort"
  @term = gets.chomp.downcase
  if @term.length == 0
    @term = "november"
  else
    while true
      expect = @months.min_by { |x| (x.chars - @term.chars | @term.chars - x.chars).size + (@term.size - x.size).abs 
      }
      case
      when @term != expect
        puts "Did you mean #{expect}?, if yes, please retype again."
        @term = gets.chomp.downcase
      when @term == expect
        break
      end
    end
  end
end

def print_header # Print title
  puts "The students of Villains Academy".center(50)
end

def print(details) # Print names of Students & Cohort
  if details == nil
    puts "ERROR!"
  else
  student_number = 1
  details.each { |student|
    puts "\n#{student_number}. #{student[:name]}\nDate of birth: #{student[:date]}\n(#{student[:cohort].to_sym} cohort)\n"
    student_number += 1
  }
end
end

def print_footer(names) # Print the total of students
  if names == nil
    puts "There is no Data in this file, please try again."
  else
  puts "Overall, we have #{names.count} great students".center(50)
  end
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
    while !name.empty?
      find_most_similar
      date_validation
      students = [] # Create array for future data
      students << {name: name, date: @date, cohort: @term}
      puts "Total of number of students is: #{students.count}".center(50)
      puts "\n(To insert more Students please enter a name. To finish, just hit return twice)."
      name = gets.chomp
      if name.length == 0
        break
      end
    end
  students
end

@months = ["january", # Dictionay of the months
  "february",
  "march",
  "april",
  "may",
  "june",
  "july",
  "august",
  "september",
  "october",
  "november",
  "december"
]

students = input_students
print_header               # Call ALL the methods
print(students)
print_footer(students)