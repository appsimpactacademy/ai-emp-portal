class AddCompOffLeavesCountToLeaveSummary < ActiveRecord::Migration[7.0]
  def change
    add_column :employee_leave_summaries, :comp_off_leaves_count, :float
  end
end
