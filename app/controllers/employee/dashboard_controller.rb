class Employee::DashboardController < ApplicationController
  # before_action :authenticate_employee!
  def index
  end

  def profile
    # TODO - Replace Employee.last with current_employee after adding devise in the app
    @employee = Employee.last
  end
end
