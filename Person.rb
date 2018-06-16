class Persons
  attr_accessor :hair_color, :eye_color, :num_teeth, :bald
  def initialize(hair_color, eye_color, num_teeth, bald)
    @hair_color = hair_color
    @eye_color = eye_color
    @num_teeth = num_teeth
    @bald = bald
  end
  def to_s
    return "Hair Color is #{@hair_color}"
  end
end

class Child < Persons
  def to_s
    return "Still a baby - nothing to report"
  end
end

class Grandchild < Child
  def to_s
    return "I am a grandchild"
  end
end

casey = Grandchild.new("Brown", "Hazel", 20, false)
puts casey.class
puts casey.to_s