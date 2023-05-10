class Admin::DashboardController < AdminController
  # before_action :authenticate_employee!
  layout 'admin'
  def index
    @current_month_birthdays = Employee.current_month_birthdays
    @current_week_birthdays = Employee.current_week_birthdays
    @tomorrow_birthdays = Employee.tomorrow_birthdays
    @today_birthdays = Employee.today_birthdays
  end
end