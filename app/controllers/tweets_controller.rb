class TweetsController < ApplicationController

	before_filter :authenticate_user!
	

	

	def index
		@tweets = Tweet.where(:user_id => current_user.id)

		@tweet = Tweet.new

	end 

	def new
		@tweet = Tweet.new

		@tweets = Tweet.where(:user_id => current_user.id)
	end
	

	def create

	@tweet = Tweet.new(params[:tweet])
	@tweet.user_id = current_user.id

	
		if @tweet.save
				redirect_to tweets_path
		else
				render :new
		end

	end

	def show
		 @tweet= Tweet.find(params[:id])
	end


	def edit
      @tweet = Tweet.find(params[:id])
   end

   def update
    @tweet = Tweet.find(params[:id])
    if !@tweet.update_attributes(params[:tweet])
      render :edit
    else
      redirect_to tweets_path
    end
   end

	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy

		redirect_to tweets_path
	end

end
