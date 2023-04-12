class Employee < ApplicationRecord

	GENDER = %w(Male Female)
	JOB_TITLE = [
		'Senior Software Engineer', 
		'Junior Software Engineer', 
		'Associate Software Engineer', 
		'QA',
		'BDE',
		'HR - Recruitment',
		'HR - Finance',
		'Senior Front End Engineer', 
		'Junior Front End Engineer'
	]

	has_many :leave_applications, dependent: :nullify
	has_many :employee_leave_summaries, dependent: :nullify

	validates :first_name, :last_name, :primary_contact, :secondary_contact,
			  :city, :state, :country, :pincode, :address_line_1, :address_line_2,
			  :gender, :title, :employee_code, :date_of_birth, :date_of_joining,
			  presence: true

	validates :email, presence: true, uniqueness: true

	def name
		"#{first_name} #{last_name}".strip
	end

	def full_name
		return name if middle_name.nil? || middle_name.blank?

		"#{first_name} #{middle_name} #{last_name}".strip
	end

	def age
		Date.today.year - date_of_birth.year
	end

	def current_leave_summary
    	employee_leave_summaries.where(year: Date.current.year).last
  	end
end
