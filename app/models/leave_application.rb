class LeaveApplication < ApplicationRecord
  # associations
  belongs_to :employee
  belongs_to :leave_type

  # validations
  validates :start_date, :end_date, :leave_location, :remarks, presence: true
  validates :end_date, comparison: { 
    greater_than: :start_date, 
    message: 'End date must be greater than start date' 
  }
  # validates :start_date, comparison: {
  #   greater_than: Date.current,
  #   message: 'You can not apply leave for past days'
  # }
  validates :status, presence: true, inclusion: { in: %w(pending approved rejected) }

  validate :paternity_leave_check
  validate :maternity_leave_check
  validate :check_cl_availability
  validate :check_sl_availability
  validate :check_el_availability
  validate :check_ol_availability
  validate :check_pl_availability
  validate :check_ml_availability

  # callbacks
  after_save :update_employee_leave_summary

  def total_leaves_applied
    (end_date - start_date).to_i
  end

  def paternity_leave_check
    return if leave_type_id.blank?
    return if employee_id.blank?

    if employee.gender == 'Female' && leave_type.short_name == 'PL'
      errors.add(:you, ' are not eligible for paternity leaves. Only applicable for male employees')
    end
  end

  def maternity_leave_check
    return if leave_type_id.blank?
    return if employee_id.blank?

    if employee.gender == 'Male' && leave_type.short_name == 'ML'
      errors.add(:you, ' are not eligible for maternity leaves. Only applicable for female employees')
    end
  end

  def check_cl_availability
    return if leave_type_id.blank?
    return if start_date.blank? || end_date.blank?

    if leave_type.short_name == 'CL' && employee.current_leave_summary.cl_available < total_leaves_applied
      errors.add(:you,  "do not have enough casual leave balance. (Available #{employee.current_leave_summary.cl_available} but applied #{total_leaves_applied})")
    end
  end

  def check_sl_availability
    return if leave_type_id.blank?
    return if start_date.blank? || end_date.blank?

    if leave_type.short_name == 'SL' && employee.current_leave_summary.sl_available < total_leaves_applied
      errors.add(:you,  "do not have enough sick leave balance. (Available #{employee.current_leave_summary.sl_available} but applied #{total_leaves_applied})")
    end
  end

  def check_el_availability
    return if leave_type_id.blank?
    return if start_date.blank? || end_date.blank?

    if leave_type.short_name == 'EL' && employee.current_leave_summary.el_available < total_leaves_applied
      errors.add(:you,  "do not have enough earned leave balance. (Available #{employee.current_leave_summary.el_available} but applied #{total_leaves_applied})")
    end
  end

  def check_ol_availability
    return if leave_type_id.blank?
    return if start_date.blank? || end_date.blank?

    if leave_type.short_name == 'OL' && employee.current_leave_summary.ol_available < total_leaves_applied
      errors.add(:you,  "do not have enough optional leave balance. (Available #{employee.current_leave_summary.ol_available} but applied #{total_leaves_applied})")
    end
  end

  def check_pl_availability
    return if leave_type_id.blank?
    return if start_date.blank? || end_date.blank?

    if leave_type.short_name == 'PL' && employee.current_leave_summary.pl_available < total_leaves_applied
      errors.add(:you,  "do not have enough paternity leave balance. (Available #{employee.current_leave_summary.pl_available} but applied #{total_leaves_applied})")
    end
  end

  def check_ml_availability
    return if leave_type_id.blank?
    return if start_date.blank? || end_date.blank?

    if leave_type.short_name == 'ML' && employee.current_leave_summary.ml_available < total_leaves_applied
      errors.add(:you,  "do not have enough maternity leave balance. (Available #{employee.current_leave_summary.ml_available} but applied #{total_leaves_applied})")
    end
  end

  def update_employee_leave_summary
    leave_summary = employee.current_leave_summary
    case leave_type.short_name
    when 'CL'
      cl_taken = leave_summary.cl_taken + total_leaves_applied
      cl_available = leave_summary.cl_available - total_leaves_applied
      leave_summary.update(cl_taken: cl_taken, cl_available: cl_available)
    when 'EL'
      el_taken = leave_summary.el_taken + total_leaves_applied
      el_available = leave_summary.el_available - total_leaves_applied
      leave_summary.update(el_taken: el_taken, el_available: el_available)
    when 'SL'
      sl_taken = leave_summary.sl_taken + total_leaves_applied
      sl_available = leave_summary.sl_available - total_leaves_applied
      leave_summary.update(sl_taken: sl_taken, sl_available: sl_available)
    when 'OL'
      ol_taken = leave_summary.ol_taken + total_leaves_applied
      ol_available = leave_summary.ol_available - total_leaves_applied
      leave_summary.update(ol_taken: ol_taken, ol_available: ol_available)
    when 'PL'
      pl_taken = leave_summary.pl_taken + total_leaves_applied
      pl_available = leave_summary.pl_available - total_leaves_applied
      leave_summary.update(pl_taken: pl_taken, pl_available: pl_available)
    when 'ML'
      ml_taken = leave_summary.ml_taken + total_leaves_applied
      ml_available = leave_summary.ml_available - total_leaves_applied
      leave_summary.update(ml_taken: ml_taken, ml_available: ml_available)
    else
    end
  end
end
