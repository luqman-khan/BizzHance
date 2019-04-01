class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  @organization = Organization.first
end
