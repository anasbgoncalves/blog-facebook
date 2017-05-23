class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.create_from_omniauth(params)
  	user = find_or_create_by(email: params.info.email)
    user.update({
  		token: params.credentials.token,
			name: params.info.name,
			avatar: params.info.image
    })
    user
  end

  def fbgraph
    fail Exceptions::Facebook::NotPresent unless token
    Facebook.fbgraph(token)
  end
end
