class Corrector
  def correct_name(name)
    name[0] = name[0].upcase
    name = name.slice(0...11) if name.length > 10
    name
  end
end

class Person
  attr_reader :id
  attr_accessor :name, :age, :rentals

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'Unknown', parent_permission = true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    @corrector = Corrector.new
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
    @name
  end

  private

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    @age >= 18
  end
  # rubocop:enable Naming/PredicateName
end

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end
end

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
  end
end
