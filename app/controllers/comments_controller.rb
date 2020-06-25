class CommentsController < ApplicationController
  def index
    @comments = policy_scope(Comment)
    @comments = Comment.all
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    authorize(@comment)
    if @comment.save
      redirect_to posts_path(anchor: "comment-anchor-#{@post.id}")
    end
  end

    private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
