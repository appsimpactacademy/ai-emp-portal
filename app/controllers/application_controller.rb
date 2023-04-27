class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource.role
    when 'admin'
      admin_dashboard_path  
    when 'employee'
      employee_dashboard_path
    end
  end
end
