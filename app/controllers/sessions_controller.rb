require_relative '../views/session_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionView.new
  end

  def sign_in
    username = @view.ask_for('username')
    password = @view.ask_for('password')
    employee = @employee_repository.find_by_username(username)
    if employee && employee.password == password
      return employee
    else
      @view.wrong_credentials
      sign_in
    end
  end
end
