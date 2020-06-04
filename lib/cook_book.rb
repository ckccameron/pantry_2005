class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    # ingredient_names = []
    # @recipes.each do |recipe|
    #   recipe.ingredients.each do |ingredient|
    #     ingredient_names << ingredient.name
    #   end
    # end
    # ingredient_names.uniq

    # ingredient_names = []
    # @recipes.each do |recipe|
    #   recipe.ingredients_required.each do |ingredient, amount|
    #     ingredient_names << ingredient.name
    #   end
    # end
    # ingredient_names.uniq

    @recipes.flat_map do |recipe|
      recipe.ingredients.map do |ingredient|
        ingredient.name
      end
    end.uniq
  end

  def highest_calorie_meal
  #  @recipes.sort_by do |recipe|
  #    recipe.total_calories
  #  end.last
  # end
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end
end
