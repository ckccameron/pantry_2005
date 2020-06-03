class Recipe
  attr_reader :name,
              :ingredients_required,
              :ingredients

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
    @ingredients = []
  end

  def add_ingredient(ingredient_name, amount)
    @ingredients_required[ingredient_name] += amount
    if @ingredients.include?(ingredient_name) == false
      @ingredients << ingredient_name
    end
  end

  def total_calories
    @ingredients_required.sum do |ingredient, amount|
      ingredient.calories * amount
    end
  end
end
