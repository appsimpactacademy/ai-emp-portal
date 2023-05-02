class CompOffLeavesMailer < ApplicationMailer

  def employee_apply_for_comp_off(employee, comp_off)
    @employee = employee
    @comp_off = comp_off
    mail(to: admin_email, subject: 'Employee submitted comp off leaves.')
  end

  def admin_change_comp_off_leave_status(comp_off, leave_status)
    @comp_off = comp_off
    @status = leave_status
    @employee = @comp_off.employee
    mail(to: @employee_email, subject: 'Admin  changed comp_off leaves status.')
  end
end
