class UsersController < ApplicationController

  before_filter :authenticate_user!

   def index
   
    @users = User.find(:all, :conditions => ["id != ?", current_user.id])
    #@friendships = Friendship.where(:approved => true)
    @friendships = Friendship.where(:primary_user_id => current_user.id)
    @friendships += Friendship.where(:friend_id => current_user.id)
      @friendships.each do |f|
        @users -= User.where(:id => f.primary_user_id)
        @users -= User.where(:id => f.friend_id)
      #@users = []
      #@friendships = Friendship.where(:approved=>false)
      #@friendships += Friendship.where(:approved=>nil)
      #@friendships.each do |f|
       
        #@users = User.where(:id => f.primary_user_id)
        #@users += User.where(:id => f.friend_id)

      end
   end



	 def edit
      @user = User.find(params[:id])
   end

    def update
    @user = User.find(params[:id])
    if !@user.update_attributes(params[:user])
      render :edit
    else
      redirect_to users_path
    end

    def avatar
      @avatar = User.avatar
    end
    
end
end
