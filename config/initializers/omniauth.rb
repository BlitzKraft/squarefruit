Rails.application.config.middleware.use OmniAuth::Builder do
	#provider :facebook, 'APP_ID', 'APP_SECRET'
  	provider :facebook,'536377926547477', 'c5c73d16c624c309d1ddb2734bde81f4', scope: 'email'
  	provider :bitbucket, 'wmyhF7CnjncpFfhFSZ', 'aWWSLTWcWLXBjr4bvWgsRG3unNHAReNX', scope: 'email'
end
