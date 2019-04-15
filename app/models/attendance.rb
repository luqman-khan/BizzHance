class Attendance < ApplicationRecord
  belongs_to :user

  before_save :add_total
  validate :is_co_greater?


  	private

	def is_co_greater?
		unless self.check_out > self.check_in
			errors.add(:check_out, "Checkout must be after check in")
		end
	end

  	def add_total
  		self.hourly_pay = self.user.current_pay_rate
  		self.total_pay = ((self.check_out-self.check_in)/3600) * self.hourly_pay.to_f
  	end

end
