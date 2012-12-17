class Api::V1::NotesController < ApplicationController
	def index
		@notes = Note.page(params[:page])
		render 'notes/v1/index'
	end

	def show
		@note = Note.find(params[:id])
		render 'notes/v1/show'
	end
end
