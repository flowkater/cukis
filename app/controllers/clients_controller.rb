class ClientsController < ApplicationController

	before_filter :authenticate_client!

	def show
		@client = Client.find(params[:id])
	end
end