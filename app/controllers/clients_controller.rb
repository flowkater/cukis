class ClientsController < ApplicationController
	before_filter :authenticate_client!

	def show
		@client = Client.find(params[:id])
		if current_client == @client
			@dayclasses = current_user.classes
		else
			redirect_to root_path
		end
	end
end