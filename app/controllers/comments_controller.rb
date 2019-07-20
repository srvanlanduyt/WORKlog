class CommentsController < ApplicationController

	before_action :require_login
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create((params[:comment]).permit(:name, :comment))
		redirect_to post_path(@post)
	end

	before_action :require_login
	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
	
end
