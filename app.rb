# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'
require_relative 'router'

meal_csv_file = File.join(__dir__, 'data/meals.csv')
customer_csv_file = File.join(__dir__, 'data/customers.csv')
employee_csv_file = File.join(__dir__, 'data/employees.csv')

meal_repo = MealRepository.new(meal_csv_file)
meals_controller = MealsController.new(meal_repo)

customer_repo = CustomerRepository.new(customer_csv_file)
customers_controller = CustomersController.new(customer_repo)

employee_repo = EmployeeRepository.new(employee_csv_file)
sessions_controller = SessionsController.new(employee_repo)

router = Router.new(meals_controller, customers_controller, sessions_controller)

router.run
