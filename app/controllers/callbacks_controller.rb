class CallbacksController < Devise::OmniauthCallbacksController
	def github
		@user = User.from_omniauth(request.env["omniauth.auth"])
		sign_in_and_redirect @user
	end
	def shapeways
		@user = User.from_omniauth(request.env["omniauth.auth"])
		sign_in_and_redirect @user
	end
	def google_oauth2
		@user = User.from_omniauth(request.env["omniauth.auth"])
		sign_in_and_redirect @user
	end
end
