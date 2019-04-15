module AttendancesHelper

	def to_date_time (date)
		return date.strftime('%d %b %H:%M:%S')
	end
end
