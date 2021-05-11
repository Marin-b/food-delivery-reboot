# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome"
    while @running
      display_tasks
      puts "What task do you want to perform?"
      action = gets.chomp.to_i
      system 'clear'
      redirect(action)
    end
  end

  private

  def redirect(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then @running = false
    else
      puts "What are you doing?"
    end
  end

  def display_tasks
    puts "Tasks:"
    puts "1. List meals"
    puts "2. Add meal"
    puts "3. List customers"
    puts "4. Add customer"
    puts "9. Exit"
  end
end
