class LeaveApplicationMailer < ApplicationMailer

  def employee_apply_for_leave_application(employee, leave_application)
    @employee = employee
    @leave_application = leave_application
    mail(to: admin_email, subject: "New Leave Request #{@employee.full_name}")
  end

  def admin_change_leave_application_status(leave_application, leave_status)
    @leave_application = leave_application
    @status = leave_status
    @employee = @leave_application.employee
    mail(to: @employee.email, subject: 'Leave Request Status')
  end
end