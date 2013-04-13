class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :first_name, :last_name

  has_attached_file :avatar, :styles => { :small => "50x50#", :medium => "150x150#" }
  # attr_accessible :title, :body

  	validates_attachment :avatar,
			#	:presence => true,
				:content_type => { :content_type => ['image/jpg', 'image/png', 'image/jpeg'] },		
				:size => { :in => 0..300.kilobytes }

	has_many :tweets
  has_many :friendships


  def username
    "#{first_name} #{last_name}"
  end
end
