require_relative '../views/meal_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    # Create view
    @meal_view = MealView.new
  end

  def list
    meals = @meal_repository.all
    @meal_view.display(meals)
  end

  def add
    name = @meal_view.ask_for('Name')
    price = @meal_view.ask_for('Price').to_i
    new_meal = Meal.new(name: name, price: price)
    @meal_repository.create(new_meal)
  end
end
