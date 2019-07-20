class PostsController < ApplicationController
	
	def index
		@posts = Post.all.order("created_at DESC")
	end



	before_action :require_login
	def new 
		@post = Post.new
	end



	before_action :require_login
	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else 
			render 'new'
		end	
	end



	def show
		@post = Post.find(params[:id])
	end



	before_action :require_login
	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to @post
		else 
			render 'edit'
		end
	end



	before_action :require_login
	def edit
		@post = Post.find(params[:id])
	end



	before_action :require_login
	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end



	private

		def post_params
			params.require(:post).permit(:title, :content)
	end

end
