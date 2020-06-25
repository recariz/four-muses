class UsersController < ApplicationController
 skip_before_action :authenticate_user!, only: :index
 before_action :set_user, only: [:follow, :unfollow, :show]

 def show
  @photos = []
  @user.posts.each do |post|
    post.photos.each do |photo|
      @photos << photo
    end
  end

 end

 def follow
   if current_user.follow(@user.id)
     respond_to do |format|
       format.html { redirect_to user_path(@user) }
       format.js
     end
   end
 end

 def unfollow
   if current_user.unfollow(@user.id)
     respond_to do |format|
       format.html { redirect_to user_path(@user) }
       format.js { render action: :follow }
     end
   end
 end

 private

 def set_user
  @user = User.find(params[:id])
  authorize @user
 end
end

