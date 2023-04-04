class LeaveType < ApplicationRecord
	LEAVE_FULL_NAMES = ['Casual Leave', 'Earned Leave', 'Optional Leave', 'Sick Leave', 'Maternity Leave', 'Paternity Leave']
	LEAVE_SHORT_NAMES = ['CL', 'EL', 'OL', 'SL', 'ML', 'PL']
	LEAVE_DESCRIPTIONS = [
		'Casual leaves are the type of leaves used most by employees. People apply these office leaves for unforeseen events where they may need to take a day or two off from work to take care of personal matters.',
		'Earned Leave(EL) also called Privilege Leave is a leave earned by an employee for the period worked. An employee usually is eligible for earned leave only after he completes 240 days of work with the company. And he usually earns one Earned Leave for every 20 days of work.',
		'Restricted holiday means a holiday that is optional, and it is the discretion of the employee whether they want to take leave on that particular day or not. Restricted holiday is also called an ‘Optional Holiday’ and it is not mandatory to close the entire office on that day.',
		'Sick leave (or paid sick days or sick pay) is paid time off from work that workers can use to stay home to address their health needs without losing pay.',
		"Maternity Leave is a paid leave/absence from work provided by an employer to a woman employee for the period before and after childbirth. Maternity is used by new mothers to take care of her and her child’s health",
		'The paternity leave is about giving fathers the right to take paid time off work following the birth (or adoption) of a child. It is mentioned period of time, where a father working as an employee under the sector is granted leave from work to take care of the newborn child.'
	]
	validates :name, presence: true

	def name_with_acronym
		"#{name} (#{short_name})"
	end
end
