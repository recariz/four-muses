class PostsController < ApplicationController
  before_action :set_post, only:[:edit, :update, :destroy]

  def index
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

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:require).permit(:description, :title, photos: [])
  end
end
