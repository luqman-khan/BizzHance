json.extract! attendance, :id, :date, :check_in, :check_out, :datetime, :hourly_pay, :decimal, :total_pay, :user_id, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
