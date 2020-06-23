class PostsController < ApplicationController
    # before_action :set_params only:[]

    def new
        @pool = Pool.new
    end
    
    def create
        @post = Post.new(strong_params)
        @post.user = current_user
        if @post.save
            redirect_to post_path(@post), notice: "Posting"
        else
            render:new
        end
    end

private

    def set_params
        @post = Post.find(params[:id])
    end

    def strong_params
        params.require(:post).permit(:title, :description)
    end


end
