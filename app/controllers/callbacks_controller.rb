class CallbacksController < Devise::OmniauthCallbacksController
	def github
		@user = User.from_omniauth(request.env["omniauth.auth"])
		begin 
		sign_in_and_redirect @user
		rescue StandardError => e
			if e.message.include? "duplicate key value"
				redirect_to new_user_session_path, flash: {notice: "Email is already registered. Please sign in."}
			else 
				redirect_to new_user_session_path, flash: {notice: "Unknown error occurred. Please try again."}
			end
		end
	end
	def bitbucket
		@user = User.from_omniauth(request.env["omniauth.auth"])
		begin 
		sign_in_and_redirect @user
		rescue StandardError => e
			if e.message.include? "duplicate key value"
				redirect_to new_user_session_path, flash: {alert: "Email is already registered. Please sign in."}
			else 
				redirect_to new_user_session_path, flash: {notice: "Unknown error occurred. Please try again."}
			end
		end

	end
	def google_oauth2
		@user = User.from_omniauth(request.env["omniauth.auth"])
		begin 
		sign_in_and_redirect @user
		rescue StandardError => e
			if e.message.include? "duplicate key value"
				redirect_to new_user_session_path, flash: {notice: "Email is already registered. Please sign in."}
			else 
				redirect_to new_user_session_path, flash: {notice: "Unknown error occurred. Please try again."}
			end
		end
	end
	def facebook
		@user = User.from_omniauth(request.env["omniauth.auth"])
		begin 
		sign_in_and_redirect @user
		rescue StandardError => e
			if e.message.include? "duplicate key value"
				redirect_to new_user_session_path, flash: {notice: "Email is already registered. Please sign in."}
			else 
				redirect_to new_user_session_path, flash: {notice: "Unknown error occurred. Please try again."}
			end
		end
	end
end
