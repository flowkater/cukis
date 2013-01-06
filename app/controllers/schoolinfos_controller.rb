class SchoolinfosController < ApplicationController
	def index
		@schoolinfos = Schoolinfo.all
		# @article = Article.spotlight.first
		@article = Article.all.first
	end

	def show
		@schoolinfo = Schoolinfo.find(params[:id])
		@articles = @schoolinfo.articles
	end
end
