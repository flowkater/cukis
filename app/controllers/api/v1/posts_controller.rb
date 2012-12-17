class Api::V1::PostsController < ApplicationController
	def index
		@posts = Post.page(params[:page])
		render 'posts/v1/index'
	end

	def show
		@post = Post.find(params[:id])
		render 'posts/v1/show'
	end
end
