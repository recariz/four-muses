class PostsController < ApplicationController
  before_action :set_post, only:[:edit, :update, :destroy]

  def index
    #first check if user is or not logged in
    #then check if there is a query or not
    #if logged in and query > filter discover
    #if logged in and no query automatically to its follows
    @posts = policy_scope(Post)
    if !current_user
      if params[:query].present?
        @posts = Post.where("location ILIKE ?", "%#{params[:query]}%")
      else
        @posts = Post.all
      end
    elsif current_user
      if params[:query].present?
        @posts = Post.where("location ILIKE ?", "%#{params[:query]}%")
      else
        @posts = Post.all
        @followings = current_user.followings
        @my_followed_posts = @posts.select {|post| @followings.include?(post.user)}
      end
    end
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create

    @post = Post.new(post_params)
    authorize @post
    @post.user = current_user
    if @post.save
      redirect_to root_path, notice: "Posting"
      # GUYS WE NEED TO CHANGE THE REDIRECT ONCE WE HAVE THE FEED
    else
      render :new
    end
  end

  def delete
  end

  def like_count
    Like.all.select
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :title, photos: [], post_tag_ids: [])
  end
end
