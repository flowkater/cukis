class DayclassesController < ApplicationController
	SmartEditor::bind_editor_images(self, "dayclass", [:create, :update])
	before_filter :authenticate_client!, only: [:new]

	def index
		@dayclasses_arr = Dayclass.approve.sort
		@dayclasses = @dayclasses_arr.select{|d| d.over_time > 0} + @dayclasses_arr.select{|d| d.over_time <= 0}.sort{|a,b| b<=>a}
	end

	def show
		@dayclass = Dayclass.find(params[:id])
		if @dayclass.approve
			@repliable = @dayclass
			@replies = @repliable.replies
			@reply = Reply.new
		else
			redirect_to root_path
		end
	end

	def new
		if current_client.is_mento
			@dayclass = Dayclass.new
		else
			redirect_to waitmento_dayclasses_path
		end
	end

	def create
		@dayclass = current_client.dayclasses.build(params[:dayclass])
		if @dayclass.save
			redirect_to success_dayclass_path(@dayclass)
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

	def success
		@dayclass = Dayclass.find(params[:id])
		if @dayclass.approve
			redirect_to @dayclass
		end
	end

	def waitmento
		if current_client.is_mento
			redirect_to new_dayclass_path
		end
	end
end
