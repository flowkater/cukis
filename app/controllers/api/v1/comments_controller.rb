class Api::V1::CommentsController < ApplicationController
	def create
		@comment = current_user.comments.build(params[:comment])

		if @comment.save!
			render status: :created, json: {response: 'success'}
		else
			render status: :unprocessable_entity, json: {response: 'error'}
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		render status: :no_content, json: {response: 'success'}
	end
end
