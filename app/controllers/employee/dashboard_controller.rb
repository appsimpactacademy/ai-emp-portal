class Employee::DashboardController < EmployeeController
  # before_action :authenticate_employee!
  layout 'employee'
  def index
    @leave_applications = Employee.includes(:leave_applications).find(current_employee.id).leave_applications
  end

  def profile
    # TODO - Replace Employee.last with current_employee after adding devise in the app
    @employee = current_employee
  end
end
