class CreateLeaveApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_applications do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :leave_type, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.boolean :is_half_day
      t.string :leave_location
      t.string :contact
      t.text :remarks
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
