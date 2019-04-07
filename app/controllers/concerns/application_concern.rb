module ApplicationConcern
	extend ActiveSupport::Concerns

	def method_missing method
		return super method unless method.to_s =~ /\w+_controller\?/
		self.class.send(:define_method, method) do
			controller_name == method.to_s.gsub(/_controller\?/, '').to_s
		end
		self.send method
	end
end
