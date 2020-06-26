class UsersController < ApplicationController

 before_action :set_user, only: [:follow, :unfollow, :edit, :update, :show]

 def show
  @photos = []
  @user.posts.each do |post|
    post.photos.each do |photo|
      @photos << photo
    end
  end
 end


def edit
 authorize @user

end

def update
  @user.update!(strong_params)
  redirect_to user_path(@user)
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
 def strong_params
  params.require(:user).permit(:avatar, :location, :biography, :nickname, :email, :password)


 end
end

