class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
  	 :omniauthable, :omniauth_providers => [ :github, :shapeways, :google_oauth2, :facebook ]
  def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
		  user.provider = auth.provider
		  user.uid = auth.uid
		  user.email = auth.info.email
		  user.password = Devise.friendly_token[0,20]
	  end
  end
  has_attached_file :profile_image
end
