Rails.application.config.middleware.use OmniAuth::Builder do
	#provider :facebook, 'APP_ID', 'APP_SECRET'
	provider :facebook, ENV['fb_app_id'], ENV['fb_secret'], scope: 'email'
	provider :bitbucket, ENV['bitbucket_app_id'], ENV['bitbucket_secret'], scope: 'email'
end
