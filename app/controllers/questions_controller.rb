class QuestionsController < ApplicationController
  def new
  	@question = Question.new
  end
 	
 	def create
 	 	@question = Question.new(params[:question])
 	 	if @question.save
 	 		
 	 		redirect_to root_path
 	 	else
 	 		redirect_to new_question_path
 	 	end
 	end
end
