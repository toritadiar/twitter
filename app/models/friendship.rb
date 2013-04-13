class Friendship < ActiveRecord::Base
  attr_accessible :approved, :friend_id, :primary_user_id

  	belongs_to :users
 	belongs_to :primary_user, :class_name => 'User'
	belongs_to :friend, :class_name => 'User', :foreign_key => :friend_id

	def friendlist
		f = Friendship.where(:primary_user_id => self.primary_user.id, :approved => true)
	end
end
