class AddStatusToLeaveApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :leave_applications, :reason_for_status_change, :text
  end
end
