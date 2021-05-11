require_relative '../views/customer_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    # Create view
    @customer_view = CustomerView.new
  end

  def list
    customers = @customer_repository.all
    @customer_view.display(customers)
  end

  def add
    name = @customer_view.ask_for('Name')
    address = @customer_view.ask_for('Address')
    new_customer = Customer.new(name: name, address: address)
    @customer_repository.create(new_customer)
  end
end
