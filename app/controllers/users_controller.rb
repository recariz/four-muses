class UsersController < ApplicationController
 skip_before_action :authenticate_user!, only: :index
 before_action :set_user, only: [:follow, :unfollow, :create, :edit, :show]

  def show
    @photos = []
    @user.posts.each do |post|
      post.photos.each do |photo|
        @photos << photo
      end
    end
  end

  def create
    if !current_user
      redirect_to user_path(@user)
    else

    end
  end

  def edit

  end

  def update

  end

  def follow
    p params
    current_user.follow(params[:user_id])
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.js {
          render :partial => 'follow.js.erb', :formats => [:json]
          # render action: :unfollow
      }
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js {
          render :partial => 'follow.js.erb', :formats => [:json]
          # render action: :follow
        }
      end
    end
  end

 private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def strong_params
  end
end
