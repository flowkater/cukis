class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@repliable = @article
		@replies = @repliable.replies
		@reply = Reply.new
	end

	def new
		@schoolinfo = Schoolinfo.find(params[:schoolinfo_id])
		@article = @schoolinfo.articles.build(params[:article])
	end

	def create
		@schoolinfo = Schoolinfo.find(params[:schoolinfo_id])
		@article = @schoolinfo.articles.build(params[:article])
		if @article.save
			redirect_to @article
		else
			redirect_to new_article_path
		end	
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(params[:article])
			redirect_to @article
		else
			redirect_to edit_article_path
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end
end
