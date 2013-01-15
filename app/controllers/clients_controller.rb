# encoding : UTF-8
class ClientsController < ApplicationController
	before_filter :authenticate_client!

	def show
		@client = Client.find(params[:id])
		if current_client == @client
			@dayclasses = current_client.dayclasses
			if current_client.introduce.nil?
				flash[:notice] = "멘토 소개를 작성해주세요."
				redirect_to edit_client_registration_path(current_client)
			else
			end
		else
			redirect_to root_path
		end
	end
end