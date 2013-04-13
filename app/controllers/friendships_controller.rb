class FriendshipsController < ApplicationController
	
	before_filter :authenticate_user!

	def index
		@friendships = Friendship.where(:friend_id => current_user.id, :approved => false)
		@users = []
		@friendships.each do |f|
			@users += User.where(:id => f.primary_user_id)
		end
	

		#displays all friends for that user
	end



	def ask
		@friendship = Friendship.new
		@friendship.primary_user_id = current_user.id
		@friendship.friend_id = params[:friend_id]
		@friendship.approved = false
		if @friendship.save
			
			
		else
			link_to tweets_path
		end	
		
	end


	def agree
		@friendship = Friendship.find(params[:friend_id])
		@friendship.approved = true
    	if @friendship.save
      		
    	else
      		redirect_to tweets_path
    	end
	end

	def reject
		@friendship = Friendship.find(params[:friend_id])
		@friendship.destroy

		redirect_to friendships_index_path
	end

end
