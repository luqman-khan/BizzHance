module SharedModelConcern

	def capitalize_name
		self.name.split(/\s+/).map(&:capitalize).join(" ")
	end

end
