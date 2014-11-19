class NotesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@notes = Note.all
	end

	def new
		@note = Note.new
	end

	def create
		@note = Note.new(note_params)
		@note.thing_id = params[:thing_id]
		if @note.save 
			redirect_to current_user, notice: "New Progress Note Succesfully Added"
		else
			redirect_to current_user
		end
	end

	private
	
	def note_params
		params.require(:note).permit(:content)
	end

end
