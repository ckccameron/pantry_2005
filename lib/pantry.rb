class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def add_ingredient(ingredient_name, amount)
    @stock[ingredient_name] = amount
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, restock_amount)
    @stock[ingredient] += restock_amount
  end
end
