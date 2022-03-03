require('./school_library_people')

class Student < Person
  def initialize(classroom,age, name = 'Unknown')
    super(age,name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student = Student.new("A",12,"Zaid")
puts student.name