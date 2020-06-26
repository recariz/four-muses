class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    like = Like.new
    like.user = @user
    like.post = @post
    authorize like
    like.save
    redirect_to posts_path(anchor: "comment-anchor-#{@post.id}")
  end

  def destroy
    like = Like.find(params[:id])
    authorize like
    like.destroy
  end

end
