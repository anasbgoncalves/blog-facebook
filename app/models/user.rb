class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.create_from_omniauth(params)
  	where(email: oarams.info.email).first_or_create do |user| 
  		user.token = params.credentials.token,
			user.name = params.info.name,
			user.email = params.info.email,
			user.avatar = params.info.image
		end
  end
end
