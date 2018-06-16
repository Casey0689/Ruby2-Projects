# NEW CLASS FROM SCRATCH - THE SQUARE
class Square

  def initialize( side_length )
    @side_length = side_length
  end

  def side_length
    return @side_length
  end

  def side_length=( side_length )
    @side_length = side_length
  end

  def perimeter
    return @side_length * 4
  end

  def area
    return @side_length * @side_length
  end

  def to_s
    "This square has a side length of #{@side_length} and an area of #{self.area}."
  end

  def draw
    draw_string =  "*" * @side_length + "\n"
    (@side_length-2).times do
      draw_string += "*" + ( " " * (@side_length-2)) + "*\n"
    end
    draw_string += "*" * @side_length + "\n"
    return draw_string
  end

end

a = String.new( "This is a string" )
my_square = Square.new( 10 )  #INITIALIZED
your_square = Square.new( 15 )  #INITIALIZED

puts "Side lengths:"
my_square.side_length = 5 #********
puts my_square.side_length
puts your_square.side_length
puts
puts "Perimeters:"
puts my_square.perimeter
puts your_square.perimeter
puts
puts "Area:"
puts my_square.area
puts your_square.area
puts
puts "Inspect mode:"
puts my_square.inspect
puts your_square.inspect
puts
puts "A single string:"
puts a
puts
b = my_square.to_s
c = your_square.to_s
puts b
puts c
puts
puts my_square.draw
puts your_square.draw
#puts "My square has a side length of #{my_square.side_length} and an area of #{my_square.area}."
#puts "Your square has a side length of #{your_square.side_length} and an area of #{your_square.area}."