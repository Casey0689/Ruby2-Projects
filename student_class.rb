#STUDENT
# ID
# MALE/FEMALE
# NAME
# AGE
# MAJOR
# CLASSES

class Student
  # attr_reader :name, :age, :gender, :student_id, :major
  # attr_writer :name, :age, :gender, :major
  attr_accessor :name, :age, :gender, :student_id, :major
  def initialize( name, age, gender, student_id, major)
    @name = name
    @age = age
    @gender = gender
    @student_id = student_id
    @major = major
    @classes = []
  end

  def add_class( class_name )
    @classes << class_name
  end

  def drop_class( class_name )
    @classes.delete( class_name )
  end

  def to_s
    return "Name: #{@name}\nAge: #{@age}\nGender: #{@gender}\nStudent ID: #{@student_id}\nMajor: #{@major}\nClasses: \n\t#{@classes.join("\n\t")}"
  end

end

casey = Student.new("Casey Johnson", 27, "Male", 2010, "CIS")
puts casey.age
puts casey.major
casey.major = "CHEMISTRY"
casey.add_class("Ruby 2")
casey.add_class("Swift")
#puts casey

klass = []
klass << casey
klass << Student.new("June", 25, "Female", 20032, "CIS")

klass.each do | student |
  puts student
end

class Item
  attr_accessor :item_id, :description, :price
  def initialize( description, price )
    @item_id = rand(100..999)
    @description = description
    @price = price
  end
end