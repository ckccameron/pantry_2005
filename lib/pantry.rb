class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def add_ingredient(ingredient_name, amount)
    @stock[ingredient_name] = amount
  end

  def stock_check(ingredient)
    if @stock[ingredient] == nil
      0
    else
      @stock[ingredient]
    end
  end

  def restock(ingredient, restock_amount)
    if @stock[ingredient] == nil
      @stock[ingredient] = restock_amount
    else
    @stock[ingredient] += restock_amount
    end
  end
end
