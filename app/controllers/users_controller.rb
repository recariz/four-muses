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
    current_user.follow(params[:user_id])
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.js {
        @post_id = params[:post_id]
        @user_id = params[:user_id]
        @user = User.find(params[:user_id])
        @posts = @user.posts
        @post = @posts.first
        @posts_all = Post.all
        @followings = current_user.followings
        @my_new_followed_posts = @posts_all.select {|post| @followings.include?(post.user)}
      }
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js {
        @post_id = params[:post_id]
        @user_id = params[:user_id]
        @user = User.find(params[:user_id])
        @posts = @user.posts
        @post = @posts.first
        @posts_all = Post.all
        @followings = current_user.followings
        @my_new_followed_posts = @posts_all.select {|post| @followings.include?(post.user)}
        render action: :follow
        }
      end
    end
  end

  def feed_card
    @post = Post.find(params[:id])
  end

 private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def strong_params
  end
end
