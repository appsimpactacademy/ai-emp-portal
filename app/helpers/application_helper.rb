module ApplicationHelper
  def flash_class(level)
    case level
      when :success then "alert alert-success"
      when :notice then "alert alert-success"
      when :alert then "alert alert-danger"
      when :error then "alert alert-danger"
      when :warning then "alert alert-warning"
    end
  end

  def status_color(leave_application)
    case leave_application.status
    when 'approved'
      'badge bg-success'
    when 'rejected'
      'badge bg-danger'
    when 'pending'
      'badge bg-warning'
    else
      'badge bg-primary'
    end
  end
end
