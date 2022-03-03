class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = 1
  end

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    @age > 18
  end
  # rubocop:enable Naming/PredicateName
  private :is_of_age?
  def can_use_services?
    is_of_age? || @parent_permission ? true : false
  end
end
