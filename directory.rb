# Puts all students into an Hash
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november},
  {name: "Jonathan Palma", cohort: :november}
]

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

print_header                                              # Call the methods
print(students)
print_footer(students)