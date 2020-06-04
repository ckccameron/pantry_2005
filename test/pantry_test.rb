require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/pantry'

class PantryTest < Minitest::Test
  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_it_starts_with_empty_stock
    pantry = Pantry.new

    expected = {}

    assert_equal expected, pantry.stock
  end

  def test_it_can_add_ingredients_to_pantry_stock
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    pantry.add_ingredient("Cheese", 0)

    expected = {"Cheese" => 0}

    assert_equal expected, pantry.stock
  end

  def test_it_can_check_ingredient_stock
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    pantry.add_ingredient("Cheese", 0)

    assert_equal 0, pantry.stock_check(ingredient1)
  end

  def test_it_can_restock_ingredient
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    pantry.add_ingredient(ingredient1, 0)

    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)

    expected = {ingredient1 => 15}

    assert_equal 15, pantry.stock_check(ingredient1)

    pantry.add_ingredient(ingredient2, 0)

    pantry.restock(ingredient2, 7)

    assert_equal 7, pantry.stock_check(ingredient2)
  end
end
