class PagesController < ApplicationController

	before_filter :authenticate_user!
		def index
			@tweets = [] #creates an array
			#@tweets = Tweet.where(:user_id => current_user.id)
			#creates a Friendship object containing all approved requests
			@friendships = Friendship.where(:primary_user_id => current_user.id, :approved => true)
			@friendships += Friendship.where(:friend_id => current_user.id, :approved => true)
			 
			#iterates through the "array", stores the corresponding tweets to the array
			@friendships.each do |f|
				@tweets += Tweet.where(:user_id => f.primary_user_id)
				@tweets += Tweet.where(:user_id => f.friend_id)
				@tweets -= Tweet.where(:user_id => current_user) #deletes repeated instance of my tweets
				
				 #refreshes with only one instance of my tweet
			end
			@tweets += Tweet.where(:user_id => current_user)
		end
end
