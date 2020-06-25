class CommentsController < ApplicationController
  def index
    @comments = policy_scope(Comment)
  end

  def create
    raise
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    authorize(@comment)
    if @comment.save
      redirect_to posts_path(anchor: "review-#{@review.id}")
    else
      render '/posts'
    end
  end

    private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
