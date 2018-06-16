class Pop
  attr_accessor :flavor, :sugar_free, :caffeine_free, :oz, :cost
  def initialize(flavor, sugar_free, caffeine_free, oz, cost)
    @flavor = flavor
    @sugar_free = sugar_free
    @caffeine_free = caffeine_free
    @oz = oz
    @cost = cost
  end

  def to_s
    return "#{@flavor}(#{@sugar_free} #{@caffeine_free}) #{@oz} Ounces $#{@cost}"
  end

  def display
    # cf = ""
    # if @caffeine_free
    #   cf = "Caffeine Free"
    # end
    # Ternary
    #(boolean expression) ? true : false
    cf = (@caffeine_free) ? "Caffeine Free" : ""
    sf = (@sugar_free) ? "Sugar Free" : ""
    return "#{@flavor}(#{sf} #{cf}) #{@oz} Ounces $#{@cost}"
  end

  def to_tab
    cf = (@caffeine_free) ? "Caffeine Free" : ""
    sf = (@sugar_free) ? "Sugar Free" : ""
    return "#{@flavor}\t#{sf}\t#{cf}\t#{@oz}\t#{@cost}"
  end

end