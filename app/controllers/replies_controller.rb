class RepliesController < ApplicationController
	before_filter :load_repliable

  def index
  	@repliable = Article.find(params[:article_id])
  	@replies = @repliable.replies
  end

  def new
  	@reply = @repliable.replies.new
  end

  def create
  	@reply = @repliable.replies.new(params[:reply])
    # @reply = current_user.replies.build(params[:reply])
  	if @reply.save
  		redirect_to @repliable
  	else
  		render :new
  	end
  end

  private

  def load_repliable
  	resource, id = request.path.split('/')[1,2]
  	@repliable = resource.singularize.classify.constantize.find(id)
  end

  # Custom URLS
  # def load_repliable
  # 	klass = [Article, Dayclass, Teamact].detect {|c| params["#{c.name.underscore}_id"]}
  # 	@repliable = klass.find(parmas["#{klass.name.underscore}_id"])
  # end
end
