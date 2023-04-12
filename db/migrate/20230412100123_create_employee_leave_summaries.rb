class CreateEmployeeLeaveSummaries < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_leave_summaries do |t|
      t.float :cl_granted
      t.float :ol_granted
      t.float :sl_granted
      t.float :pl_granted
      t.float :ml_granted
      t.float :el_granted
      t.float :cl_taken, default: 0.0
      t.float :ol_taken, default: 0.0
      t.float :el_taken, default: 0.0
      t.float :sl_taken, default: 0.0
      t.float :pl_taken, default: 0.0
      t.float :ml_taken, default: 0.0
      t.float :cl_available
      t.float :ol_available
      t.float :sl_available
      t.float :el_available
      t.float :pl_available
      t.float :ml_available
      t.integer :year
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
