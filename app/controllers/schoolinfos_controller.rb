class SchoolinfosController < ApplicationController
	def index
		@schoolinfos = Schoolinfo.all
	end

	def show
		@schoolinfo = Schoolinfo.find(params[:id])
		@articles = @schoolinfo.articles
	end
end
