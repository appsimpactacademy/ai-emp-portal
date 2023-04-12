json.extract! leave_application, :id, :employee_id, :leave_type_id, :start_date, :end_date, :is_half_day, :leave_location, :contact, :remarks, :created_at, :updated_at
json.url leave_application_url(leave_application, format: :json)
