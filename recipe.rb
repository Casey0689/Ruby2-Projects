class Recipe

  def initialize( title, serves)
    @title = title
    @serves = serves
    @ingredients = []
  end

  def title
    return @title
  end

  def title=( title )
    @title = title
  end

  def serves
    return @serves
  end

  def serves=( serves )
    @serves = serves
  end

  def add_ingredient( ingredient )
    @ingredients << ingredient
  end

  def remove_ingredient( ingredient )
    @ingredients.delete( ingredient )
  end

  def to_s
    return "Delicious #{@title} that serves #{@serves}.\n Made with:\n\t #{@ingredients.join("\n\t ")}"
  end

end

pie = Recipe.new("Cherry Pie", 8)
pie.add_ingredient("Jam")
pie.add_ingredient("Poop")
pie.add_ingredient("Turds")
puts pie

pie.title = "Sugar Free Cherry Pie"
puts pie