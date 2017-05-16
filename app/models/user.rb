class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable, :recoverable, :rememberable, :trackable
end
