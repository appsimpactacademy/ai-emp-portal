json.extract! employee, :id, :first_name, :middle_name, :last_name, :date_of_birth, :date_of_joining, :email, :primary_contact, :secondary_contact, :address_line_1, :address_line_2, :city, :state, :country, :pincode, :gender, :title, :employee_code, :created_at, :updated_at
json.url employee_url(employee, format: :json)
