class CreateLeaveTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_types do |t|
      t.string :name
      t.string :short_name
      t.text :description

      t.timestamps
    end
  end
end
