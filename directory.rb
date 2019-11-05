# Puts all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
  "Jonathan Palma"
]

def print_header                                          # Print title
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(names)                                          # Print names of Students
  names.each { |student|
    puts student
  }
end

def print_footer(names)                                   # Print the total of students
  puts "Overall, we have #{names.count} great students"
end

print_header                                              # Call the methods
print(students)
print_footer(students)