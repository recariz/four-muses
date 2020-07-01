class UsersController < ApplicationController
 skip_before_action :authenticate_user!, only: :index
 before_action :set_user, only: [:follow, :unfollow, :create, :edit, :show]

  def show
    @posts = []
    @user.posts.each do |post|
      @posts << post
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
    if current_user.follow(params[:user_id])
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js {
            @my_new_followed_posts = current_user.followings.map(&:posts).flatten
            @user_id = params[:user_id]
            @followings = current_user.followings
            render :partial => 'follow.js.erb', :formats => [:json]
        }
      end
    end
  end

  def unfollow
    authorize @user
    if current_user.unfollow(params[:user_id])
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js {
          @my_new_followed_posts = current_user.followings.map(&:posts).flatten
          @user_id = params[:user_id]
          @followings = current_user.followings
          render :partial => 'follow.js.erb', :formats => [:json]
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
