class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		#TODO add sanitizers here.
		#devise_parameter_sanitizer.for(:user) << :threeD_model
	end
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
