require "colorize"
@students = [] # Create array for future data

def print_header(names) # Print title
  if !names.empty?
    puts "The students of Villains Academy".center(100).bold
  else
    nil
  end
end

def print_student_list(details) # Print names of Students & Cohort
  if details == nil
    puts nil
  else
    details.each { |student|
        puts "\n#{student[:number]}. #{student[:name]}\nDate of birth: #{student[:date]}\n(#{student[:cohort]} cohort)"
    }
  end
end

def print_footer(names) # Print the total of students
  if !names.empty?
    if names.count <= 1
      puts "Overall, we have #{names.count} student".center(100).bold
    else
      puts "Overall, we have #{names.count} students".center(100).bold
    end
  else
    nil
  end
end

def input_students # Store the details of the students 
  puts "Please enter the name of the student"
  name = STDIN.gets.chomp
    while !name.empty?
      find_most_similar
      date_validation
      @students << {number: @students.count + 1, name: name, date: @date, cohort: @term}
      puts "All the details of #{name} was processed with success.".bold
      puts "Total of number of students is: #{@students.count}".center(50)
      puts "\n(To insert more Students please enter a name. To finish, just hit return twice)."
      name = STDIN.gets.chomp
      if name.length == 0
        break
      end
    end
  @students
end

def date_validation # Correct date format
  puts "Date of birth (DD-MM-YYYY)"
  @date = STDIN.gets.chomp
  until /(\d{2}-\d{2}-\d{4})/.match(@date)
    puts "Incorrect format, please try again"
    @date = STDIN.gets.chomp
  end
end

def find_most_similar # Dictionary correction for Cohort implementation
  puts "and his cohort"
  @term = STDIN.gets.strip
  if @term.empty?
    @term = "november"
    puts "Default cohort: #{@term}"
  else
    while true
      expect = @months.min_by { |x| (x.chars - @term.chars | @term.chars - x.chars).size + (@term.size - x.size).abs 
      }
      case
      when @term.empty?
        @term = "november"
        puts "Default cohort: #{@term}"
      when @term != expect
        puts "Did you mean #{expect}?, if yes, please retype again."
        @term = STDIN.gets.strip
      when @term == expect
        break
      end
    end
  end
end

@months = ["january", # Dictionary of the months   
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

def process(selection) # Interactive Menu - Choices
  case selection.to_s
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # terminates our file
  else
    puts "I don't know what you meant, please try again."
  end 
end

def print_menu # Print the Heah of the Interactive menu
  puts "Please choose a number from the following options:".bold
  puts "1. Input a Student"
  puts "2. Show the Students"
  puts "3. Save the list to Students.cvs"
  puts "4. Load the list from Students.cvs"
  puts "9. Exit"
end

def show_students # Show the all student's details
  print_header(@students)
  print_student_list(@students)
  print_footer(@students)
end 

def interactive_menu # Cicle of the interactive Menu until it terminates
  loop do
    print_menu
    puts ""
    input = STDIN.gets.chomp
    process(input)
  end
end

def save_students # Save details into a file .csv
  puts "Please, insert the name of the file."
  file_name = STDIN.gets.chomp
  file = File.open(file_name, "w")
  puts "Details have been saved with success to #{file_name}"
  @students.each { |student|
    student_data = [student[:number], student[:name], student[:date], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  file.close
end

def load_students(filename = "Students.csv") # Load the details from the file to @students variable
  file = File.open(filename, "r")
  file.readlines.each { |line|
  number, name, date, cohort = line.chomp.split(",")
  @students << {number: number, name: name, date: date, cohort: cohort}
  }
  file.close
end

def try_load_students # Verify if the file exists
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu