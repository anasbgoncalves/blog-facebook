class User < ActiveRecord::Base

  devise :omniauthable, omniauth_providers: [:facebook]

  def self.create_from_omniauth(params)
  	user = find_or_create_by(email: params.info.email, uid: params.uid)
    user.update({
  		token: params.credentials.token,
			name: params.info.name,
			avatar: params.info.image
    })
    user
  end
end
