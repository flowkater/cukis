class UsersController < ApplicationController
	before_filter :authenticate_user!

	def show
		@user = User.find(params[:id])
		if current_user == @user
			@dayclasses = current_user.classes	
		else
			redirect_to root_path
		end
	end
end