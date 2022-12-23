require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'book'
require 'colorize'

OPTIONS = {
  '1' => :list_books,
  '2' => :list_people,
  '3' => :create_person,
  '4' => :create_book,
  '5' => :create_rental,
  '6' => :list_rentals,
  '7' => :quit
}.freeze
# Define the Person class

class App
  # Create an empty list of people
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  # Display the main menu
  def display_menu
    puts ''
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  # Loop until the user selects the "Quit" option
  def selection
    loop do
      puts ''
      print 'Please choose an option by entering a number: '
      display_menu
      choice = gets.chomp
      action = OPTIONS[choice]

      if action == :quit
        puts 'Thank you for using this app!'.colorize(:green)
        break
      elsif action
        send(action)
      else
        puts 'INVALID OPTION, please, try again'.colorize(:red)
      end
      # if_condition
    end
    # loop
  end
  # selection

  def list_books
    message = @books.empty? && "\nNo books added, please, add some books \n".colorize(:red)
    puts message
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}".colorize(:green)
    end
  end

  def list_people
    message = @people.empty? && "\nNo people added, please, add some people \n".colorize(:red)
    puts message
    @people.each do |person|
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}".colorize(:green)
    end
  end

  def create_person
    print "Do you want to create a student #{'(1)'.colorize(:green)} or a teacher '(2)'? [Input the number]: "
    option_person = gets.chomp.to_i
    case option_person
    when 1
      print 'Age: '; person_age = gets.chomp.to_i
      print 'Name: '; person_name = gets.chomp.to_s
      print 'Has parent permission? [Y/N]: '; person_permission = gets.chomp.to_s
      add_student(person_permission, person_age, person_name)
      puts 'Person created successfully'.colorize(:green)
    when 2
      print 'Age: '
      person_age = gets.chomp.to_i
      print 'Name: '
      person_name = gets.chomp.to_s
      print 'Specialization: '
      person_specialization = gets.chomp.to_s
      @people.push(Teacher.new(person_age, person_specialization, name: person_name))
      puts 'Person created successfully'.colorize(:green)
    else
      puts 'Error: Invalid number, try again'.colorize(:red)
      send(:create_person)
    end
  end

  def add_student(person_permission, person_age, person_name)
    if person_permission.capitalize == 'N'
      @people.push(Student.new(person_age, name: person_name, parent_permission: false))
    else
      @people.push(Student.new(person_age, name: person_name))
    end
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp.to_s
    print 'Author: '
    book_author = gets.chomp.to_s
    @books.push(Book.new(book_title, book_author))
    puts 'Book created successfully'.colorize(:green)
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |object, index|
      puts "#{index}) Title: '#{object.title}', Author: #{object.author}".colorize(:green)
    end
    book_number = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |object, index|
      puts "#{index}) [#{object.class}] Name: #{object.name}, ID: #{object.id}, Age: #{object.age}".colorize(:green)
    end
    person_number = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp.to_s
    @rentals.push(Rental.new(@books[book_number], @people[person_number], date))
    puts 'Rental created successfully'.colorize(:green)
  end

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |object|
      puts "Date: #{object.date}, Book '#{object.book.title}' by #{object.book.author}" if object.person.id == person_id
    end
  end
end
