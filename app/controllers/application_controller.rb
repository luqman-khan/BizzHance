class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_organization unless controller_name == 'organization'

  def set_organization
  	@organization = Organization.first
  end
  
end
