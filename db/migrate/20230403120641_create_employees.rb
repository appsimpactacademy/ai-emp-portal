class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.date :date_of_joining
      t.string :email
      t.string :primary_contact
      t.string :secondary_contact
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :gender
      t.string :title
      t.string :employee_code

      t.timestamps
    end
  end
end
