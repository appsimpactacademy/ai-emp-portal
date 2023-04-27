class AdminController < ApplicationController
  before_action :verified_admin_user?
  
  private
  def verified_admin_user?
    unless employee_signed_in? && current_employee.role == 'admin'
      redirect_to employee_dashboard_path, alert: 'You are not authorized to visit this page'
    end
  end
end