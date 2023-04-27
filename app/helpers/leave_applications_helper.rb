module LeaveApplicationsHelper
  def leave_application_buttons(leave_application)
    case leave_application.status
    when "pending"
      "success"
    when "approved"
      "warning"
    when "rejected"
      "success"
    else
      "primary"
    end
  end
end
