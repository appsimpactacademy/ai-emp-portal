# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

1000.times do |i|
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
	puts "Employee #{employee.id} created successfully"
end

LeaveType::LEAVE_FULL_NAMES.each_with_index do |leave, index|
	LeaveType.create(name: leave, short_name: LeaveType::LEAVE_SHORT_NAMES[index],description: LeaveType::LEAVE_DESCRIPTIONS[index])
end
