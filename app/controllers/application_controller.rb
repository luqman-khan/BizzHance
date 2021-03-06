class ApplicationController < ActionController::Base
	include ApplicationConcern

  	protect_from_forgery with: :exception
  	before_action :authenticate_user!
	before_action :set_organization, unless: [:organization_controller?, :devise_controller?]

  	def set_organization
	  	@organization = current_user.organization
	  	unless @organization.authorize
	  		redirect_to new_user_session_path, notice: "Please contact us to get this organization approved"
	  	end
  	end

  	def authorize_user?
    unless params.include?(:user) && User.find_by_email(params.require(:user)[:email]).authorize
      redirect_to new_user_session_path, notice: "Please wait until you get approved"
    end
  end
  
end
