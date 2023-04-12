class LeaveApplication < ApplicationRecord
  belongs_to :employee
  belongs_to :leave_type

  validates :start_date, :end_date, :leave_location, :remarks, presence: true
  validates :start_date, comparison: { greater_than: :end_date }
  validates :status, presence: true, inclusion: { in: %w(pending approved rejected) }
end
