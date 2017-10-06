class NotesController < ApplicationController
	def index
	end

	def create
	  note = Note.create(note_params)
	  	if note.valid?
		  render json: note, status: :created
		else
			render json: render_error(note), status: :unprocessable_entity
		end
	end

	private

	def note_params
		params.require(:note).permit(:title, :content)
	end

	def render_error(note)
		{ errors: note.errors }
	end
end
