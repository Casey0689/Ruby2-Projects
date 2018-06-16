#PROPERTIES
# contains soda's
# coin slot
# power
# selection buttons
# temperature sensor/display
# distribute the soda
# money

#ACTIONS
# select a soda
# add money
# get change
# get soda
# look at temperature
# turn it on/off

class VendingMachine
  attr_accessor :power, :money, :selection, :temperature, :user_money
  def initialize
    @power = "off"
    @money = 0.0
    @user_money = 0.0
    @selection = ""
    @temperature = 0.0
    @items = []
  end

  def add_user_money( coins )
    @user_money += coins
  end

  def find_all_pops_matching( match_string )
    # temp_array_of_items = []
    # @items.each do | item |
    #   if ( item.flavor.downcase =~ /.*#{match_string.downcase}.*/ )
    #     temp_array_of_items << item
    #   end
    # end
    # return temp_array_of_items
    return @items.select{ |item| item.flavor.downcase =~ /.*#{match_string.downcase}.*/ }
  end

  def find_pops_worth( price )
    temp_array_of_items = []
    @items.each do | item |
      if ( price == item.cost )
        temp_array_of_items << item
      end
    end
    return temp_array_of_items
  end

  def return_change
    change = @user_money
    @user_money = 0
    return change

  end

  def dispense_item( item_num )
    item = @items[ item_num - 1 ]
    @user_money -= item.cost
    @items.delete( item )
    return item
  end

  def display_user_money
    return @user_money
  end

  def add_item( item )
    @items << item
  end


  def get_item( item_number )
    return @items[ item_number - 1 ]
  end

  def display_contents
    ret_str = ""
    @items.each do | item |
      ret_str += item.display + "\n"
    end
    return ret_str
  end

  def display_selections
    ret_str = ""
    @items.each_with_index do | item, index |
      ret_str += "#{index + 1}. #{item}\n"
    end
    return ret_str
  end

  def get_tabbed_data
    ret_str = ""
    @items.each do | item |
      ret_str += item.to_tab + "\n"
    end
    return ret_str
  end

  def to_s

  end

end