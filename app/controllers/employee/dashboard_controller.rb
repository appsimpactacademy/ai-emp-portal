class Employee::DashboardController < EmployeeController
  # before_action :authenticate_employee!
  layout 'employee'
  def index
  end

  def profile
    # TODO - Replace Employee.last with current_employee after adding devise in the app
    @employee = current_employee
  end
end
