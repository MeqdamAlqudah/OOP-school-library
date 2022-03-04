class Corrector
  def correct_name(name)
    name[0] = name[0].upcase
    name = name.slice(0...11) if name.length > 10
    name
  end
end

class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    @corrector = Corrector.new
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

person = Person.new(22, 'meqdam')
puts person.validate_name

person2 = Person.new(13, 'meq fdjalljjjljlkljljljlkjlkjkljj')
puts person2.validate_name
