class SchoolinfosController < ApplicationController
	def index
		@schoolinfos = Schoolinfo.approve
		@article = Article.spotlight.first
	end

	def show
		@schoolinfo = Schoolinfo.find(params[:id])
		@article = @schoolinfo.articles.first

		if @article
			redirect_to article_path(@article)
		end
	end
end
