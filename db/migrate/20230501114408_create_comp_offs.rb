class CreateCompOffs < ActiveRecord::Migration[7.0]
  def change
    create_table :comp_offs do |t|
      t.date :for_date
      t.text :description
      t.string :status
      t.text :reason_to_change_status
      t.string :check_in
      t.string :check_out
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
