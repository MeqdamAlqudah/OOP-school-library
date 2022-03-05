require('./school_library_people')

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    student.classroom = @label
    @students.push(student)
  end
end

class Student < Person
  attr_accessor :classroom

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(classroom, age, name = 'Unknown', permission = true)
    super(age, name, permission)
    @classroom = classroom
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def add_to_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
