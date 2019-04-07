class ApplicationController < ActionController::Base
	include ApplicationConcern

  	protect_from_forgery with: :exception
  	before_action :authenticate_user!, unless: [:devise_controller?]
	before_action :set_organization, unless: [:organization_controller?, :devise_controller?]

  	def set_organization
	  	@organization = current_user.organization
	  	unless @organization.authorize
	  		redirect_to new_session_path, note: "Please contact us to get this organization approved"
	  	end
  	end

  	
  
end
