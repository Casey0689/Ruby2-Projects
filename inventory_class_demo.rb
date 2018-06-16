# Inventory Class
# { 123 => ["shirt", 19.99]}

class Item
  #* attr_accessor :description, :price
  # attr_reader :description
  # attr_writer :description
  def initialize( description, price )
    @id = rand(100..999)
    @description = description
    @price = price
    @sizes = []
  end

  def id          #GETTER
    return @id
  end

  def description    #GETTER
    return @description
  end

  def description=( description )    #SETTER
    @description = description
  end

  def price       #GETTER
    return @price
  end

  def price=( price )    #SETTER
    @price = price
  end

  def add_size( size )
    @sizes << size
  end

  def remove_size( size )
    @sizes.delete( size )
  end

  def sizes
    return @sizes
  end

  def to_s
    return "#{@id}\t#{@description}\t#{@price} sizes: " + @sizes.join(", ")
  end

end

shirt = Item.new("shirt", 19.99)
shirt.add_size( "Small" )
shirt.add_size( "Large" )
pants = Item.new("pants", 49.99)
puts pants.to_s
pants.add_size( "Medium" )
pants.add_size( "X-Large" )
puts shirt.to_s
puts pants.to_s
#shirt.remove_size( "Small")
puts shirt.to_s
puts shirt.price
puts

# CHANGE VALUES
shirt.description = "Hawaiian Shirt"
shirt.price = 69.99
puts shirt
shirt.sizes.each do | size |
  puts size
end