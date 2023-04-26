# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

1000.times do |i|
	ActiveRecord::Base.transaction do 
		employee = Employee.create(
			first_name: Faker::Name.first_name,
			middle_name: Faker::Name.middle_name,
			last_name: Faker::Name.last_name,
			email: Faker::Internet.email,
			primary_contact: Faker::PhoneNumber.phone_number_with_country_code,
			secondary_contact: Faker::PhoneNumber.phone_number_with_country_code,
			address_line_1: Faker::Address.street_name,
			address_line_2: Faker::Address.street_address,
			city: Faker::Address.city,
			state: Faker::Address.state,
			country: Faker::Address.country,
			pincode: Faker::Address.postcode,
			date_of_birth: Date.today - rand(24..36).years,
			date_of_joining: Date.today - rand(2..5).years,
			gender: Employee::GENDER.sample,
			title: Employee::JOB_TITLE.sample,
			employee_code: "AI0000#{000000+(i+1)}"
		)

		# creating employee leave summary for employee
		pl_leaves_count = employee.gender == 'Male' ? 15 : 0
		ml_leaves_count = employee.gender == 'Female' ? 180 : 0
		employee.employee_leave_summaries.create(
		   cl_granted: 12,
	       ol_granted: 6,
	       sl_granted: 6,
	       pl_granted: pl_leaves_count,
	       ml_granted: ml_leaves_count,
	       el_granted: 6,
	       cl_available: 12, 
	       ol_available: 6,
	       sl_available: 6,
	       el_available: 6,
	       pl_available: pl_leaves_count,
	       ml_available: ml_leaves_count,
	      year: Date.today.year
		)

		puts "Employee #{employee.id} created successfully"
	end
end

Employee.all.each do |employee|
	employee.update(password: "password#{employee.employee_code}")
end


LeaveType::LEAVE_FULL_NAMES.each_with_index do |leave, index|
	LeaveType.create(name: leave, short_name: LeaveType::LEAVE_SHORT_NAMES[index],description: LeaveType::LEAVE_DESCRIPTIONS[index])
end
