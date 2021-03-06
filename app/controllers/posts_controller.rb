class PostsController < ApplicationController
  before_action :set_post, only:[:edit, :show, :update, :destroy]

  def index
    #first check if user is or not logged in
    #then check if there is a query or not
    #if logged in and query > filter discover
    #if logged in and no query automatically to its follows
    @posts = policy_scope(Post)
   if user_signed_in?
        @followings = current_user.followings
        @my_followed_posts = @posts.select {|post| @followings.include?(post.user)}
    end

    respond_to do |format|
      format.html
      format.json {
        @post = Post.find(params[:id])
        render json: { count: @post.get_likes.size }
      }
    end
  end

  def show
    authorize @post
    @posts = Post.all
    @followings = current_user.followings
    @my_followed_posts = @posts.select {|post| @followings.include?(post.user)}
  end

  def edit
  end

  def new
    @post = Post.new
    authorize @post
    @categories = Category.pluck(:name, :id)

  end

  def create

    @post = Post.new(post_params)
    authorize @post
    @post.user = current_user
    if params[:category_ids]
      categories = Category.where(id: params[:category_ids])
      @post.post_tags << categories.map {|c| PostTag.new(category: c)}
    end
    if @post.save
      redirect_to user_path(current_user), notice: "Posting"
      # GUYS WE NEED TO CHANGE THE REDIRECT ONCE WE HAVE THE FEED
    else
      render :new
    end
  end

  def delete
  end

  def like
    current_user
      @post = Post.find(params[:id])
      authorize @post
      @post.liked_by current_user
      respond_to do |format|
        format.js {
          @new_count = @post.get_likes.size
          render :partial => 'like.js.erb', :formats => [:json]
        }
      end
  end

  def dislike
    @post = Post.find(params[:id])
    authorize @post
    @post.disliked_by current_user
    @new_count = @post.get_likes.size
    respond_to do |format|
      format.js {
        @new_count = @post.get_likes.size
        render :partial => 'like.js.erb', :formats => [:json]
      }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :title, photos: [], post_tag_ids: [])
  end
end
