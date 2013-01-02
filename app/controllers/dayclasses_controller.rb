class DayclassesController < ApplicationController
	def index
		@dayclasses = Dayclass.all
	end

	def show
		@dayclass = Dayclass.find(params[:id])
		@repliable = @dayclass
		@replies = @repliable.replies
		@reply = Reply.new
	end

	def new
		@dayclass = Dayclass.new
	end

	def create
		@dayclass = Dayclass.new(params[:dayclass])
		if @dayclass
			redirect_to @dayclass
		else
			redirect_to new_dayclass_path
		end
	end

	def edit
		@dayclass = Dayclass.find(params[:id])
	end

	def update		
		@dayclass = Dayclass.find(params[:id])
		if @dayclass.update_attributes(params[:dayclass])
			redirect_to @dayclass
		else
			redirect_to edit_dayclass_path
		end
	end

	def destroy
		@dayclass = Dayclass.find(params[:id])
		@dayclass.destroy
		redirect_to dayclasses_path
	end
end
