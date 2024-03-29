class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :url, :username

  has_many :clients
  def self.find_for_facebook_oauth access_token
     if user = User.where(:url => access_token.info.urls.Facebook).first
       user
     else 
       User.create!(:url => access_token.info.urls.Facebook, :username => access_token.extra.raw_info.name, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20]) 
     end
  end
  
end
