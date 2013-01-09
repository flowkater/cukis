class SchoolinfosController < ApplicationController
	def index
		@schoolinfos = Schoolinfo.approve
		@article = Article.spotlight.first
	end

	def show
		@schoolinfo = Schoolinfo.find(params[:id])
		@articles = @schoolinfo.articles
	end
end
