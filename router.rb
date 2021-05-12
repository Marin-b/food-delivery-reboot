# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    @employee = @sessions_controller.sign_in
    puts "[#{@employee.role}] Welcome #{@employee.username}"
    while @running
      if @employee.role == 'manager'
        display_manager_tasks
        puts "What task do you want to perform?"
        action = gets.chomp.to_i
        system 'clear'
        manager_redirect(action)
      else
        display_rider_tasks
        puts "What task do you want to perform?"
        action = gets.chomp.to_i
        system 'clear'
        rider_redirect(action)
      end
    end
  end

  private

  def manager_redirect(action)
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

  def display_manager_tasks
    puts "Tasks:"
    puts "1. List meals"
    puts "2. Add meal"
    puts "3. List customers"
    puts "4. Add customer"
    puts "9. Exit"
  end

  def rider_redirect(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @customers_controller.list
    when 9 then @running = false
    else
      puts "What are you doing?"
    end
  end

  def display_rider_tasks
    puts "Tasks:"
    puts "1. List meals"
    puts "2. List customers"
    puts "9. Exit"
  end
end
