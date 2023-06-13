class Employee < ApplicationRecord

  paginates_per 10

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :trackable, :confirmable,
  authentication_keys: [:login]

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
  has_many :comp_offs, dependent: :nullify

  validates :first_name, :last_name, :primary_contact, :secondary_contact,
  :city, :state, :country, :pincode, :address_line_1, :address_line_2,
  :gender, :title, :employee_code, :date_of_birth, :date_of_joining,
  presence: true

  validates :email, presence: true, uniqueness: true

  attr_accessor :login

  def login
  	@login || self.employee_code || self.email
  end

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

  def self.find_for_database_authentication(warden_conditions)
  	conditions = warden_conditions.dup
  	if (login = conditions.delete(:login))
  		where(conditions.to_h).where(["lower(employee_code) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  	elsif conditions.has_key?(:employee_code) || conditions.has_key?(:email)
  		where(conditions.to_h).first
  	end
  end

  ROLES = %w{ admin employee }

  ROLES.each do |role_name|
  	define_method "#{role_name}?" do
  		role == role_name
  	end
  end


  def self.current_month_birthdays
    #where('EXTRACT(month from date_of_birth) = ?', Date.today.strftime('%m'))
    where("strftime('%m', date_of_birth) = ?", Date.today.strftime('%m'))
  end

  def self.current_week_birthdays
   today = Date.today
   start_of_week = today.beginning_of_week
   end_of_week = today.end_of_week
   where("date_of_birth BETWEEN ? AND ?", start_of_week, end_of_week)
 end

 def self.tomorrow_birthdays
  tomorrow = Date.today
  where("date_of_birth = DATE(?, '+1 day')", tomorrow)
end

def self.today_birthdays
  today = Date.today
  where("date_of_birth = DATE(?)", today)
end

end
