class CompOff < ApplicationRecord
  belongs_to :employee

  validates :for_date, :description, presence: true
  validates_uniqueness_of :for_date, scope: :employee_id

  before_create :set_default_status
  after_create :update_employee_leave_summary

  def set_default_status
    self.status = 'pending'
  end

  def update_employee_leave_summary
    leave_summary = employee.current_leave_summary
    new_comp_off_leave_balance = leave_summary.comp_off_leaves_count.to_i + 1
    leave_summary.update(comp_off_leaves_count: new_comp_off_leave_balance)
  end
end
