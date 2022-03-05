require 'pry'

require('./student')
require('./teacher')
puts "\nWelcome to School Library App!\n"

class_room = Classroom.new('A')
teachers = []
books_array = []
rentals = []
inputs =
  "\nPlease choose an option by enterin a number:\n" \
  "1 - list all books\n" \
  "2 - list all people\n" \
  "3 - Create a person\n" \
  "4 - Create a book\n" \
  "5 - Create a rental\n" \
  "6 - list all rentals for a given person id\n" \
  "7 - Exit\n"
flag = true
while flag
  puts inputs
  choice = gets.chomp
  case choice
  when '1'
    if books_array.length.eql?(0)
      puts 'There is no books '
    else
      books_array.each do |single|
        puts "Title: \"#{single.title}\" , Author: #{single.author}"
      end

    end

  when '2'
    if class_room.students.length.eql?(0) && teachers.length.eql?(0)
      puts "\n There is no persons\n"
    else
      class_room.students.each do |single|
        puts "[Student] Name: #{single.name},ID: #{single.id}, Age: #{single.age} "
      end
      teachers.each do |single|
        puts "[Teacher] Name: #{single.name},ID: #{single.id}, Age: #{single.age} "
      end
    end
  when '3'
    print 'Do you want to create a student (1) or a teacher (2)?[Input the number]:'
    sub_choice = gets.chomp
    case sub_choice
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      permission_state = gets.chomp.upcase
      # rubocop:disable Metrics/BlockNesting
      case permission_state
      when 'Y'
        student = Student.new('', age, name, true)
        class_room.add_student(student)
      when 'N'
        student = Student.new('', age, name, false)
        class_room.add_student(student)
      else
        puts 'Wrong Input'
      end
      # rubocop:enable Metrics/BlockNesting
      puts "\nPerson created successfully\n"
    when '2'
      print 'Age:'
      age = gets.chomp
      print 'Name:'
      name = gets.chomp
      print 'Specialization:'
      specialization = gets.chomp
      teacher = Teacher.new(specialization, age, name)
      teachers.push(teacher)
      puts "\nPerson created successfully\n"
    else
      puts "\nPlease enter valid input\n "
    end
  when '4'
    print 'Title:'
    title = gets.chomp
    print "\nAuthor:"
    author = gets.chomp
    puts "\nBook created successfully"
    books_array.push(Book.new(title, author))
  when '5'
    puts 'Select a book from the following list by number'
    count = 0
    books_array.each do |single|
      puts "#{count}) Title: \"#{single.title}\" , Author: #{single.author}"
      count += 1
    end
    book_number = gets.chomp
    puts "\n"
    count = 0
    puts 'Select a person from the following list'
    class_room.students.each do |single|
      puts "#{count}) [Student] Name: #{single.name},ID: #{single.id}, Age: #{single.age} "
      count += 1
    end
    student_number = gets.chomp
    puts "\n"
    print 'Date:'
    date = gets.chomp
    rentals.push(class_room.students[student_number.to_i].add_rental(date, books_array[book_number.to_i]))
    puts 'Rental created successfully'
  when '6'
    print 'ID of person:'
    id = gets.chomp.to_i
    rentals.each do |single|
      puts single.person.id
      puts "Date: #{single.date},Book \"#{single.book.title}\" by #{single.book.author}" if single.person.id.eql? id
    end

  when '7'
    flag = false
  else
    puts 'Please enter valid input '
  end
end
