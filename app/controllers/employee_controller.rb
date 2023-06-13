class EmployeeController < ApplicationController
  before_action :authenticate_employee!
  before_action :verified_employee?
  
  private
  def verified_employee?
    unless employee_signed_in? && current_employee.role == 'employee'
      redirect_to admin_dashboard_path, alert: 'You are not authorized to visit this page'
    end
  end
end