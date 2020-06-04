class Recipe
  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient_name, amount)
    @ingredients_required[ingredient_name] += amount
  end

  def ingredients
    @ingredients_required.keys

    # ingredients = []
    # @ingredients_required.each do |ingredient, amount|
    #   ingredients << ingredient
    # end
    # ingredients
  end

  def total_calories
    @ingredients_required.sum do |ingredient, amount|
      ingredient.calories * amount
    end
  end
end
