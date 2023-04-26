class LeaveApplicationMailer < ApplicationMailer

  def employee_apply_for_leave_application(employee, leave_application)
    @employee = employee
    @leave_application = leave_application
    mail(to: admin_email, subject: 'Employee Leaves Apply')
  end
end