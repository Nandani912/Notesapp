class NotesController < ApplicationController
  before_action :authenticate_user!
  
  def index 
    @notes = current_user.notes
  end
  def show
    @note = Note.find(params[:id])
  end
  def new
    @note = Note.new
  end
  def create
     @note = current_user.notes.build(note_params)
     @note.user = current_user
     if @note.save
     redirect_to notes_path, notice: 'Note was successfully created.'
     else
     render :new
     end
end
def edit
  @note = Note.find(params[:id])
  end
  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to notes_path, notice: 'Note was successfully updated.'
      else
        render :edit
        end
        end
        def destroy
          @note = Note.find(params[:id])
          @note.destroy
          redirect_to notes_path, notice: 'Note was successfully destroyed.'
          end

private 
def note_params
  params.require(:note).permit(:title, :description, :date)
end
end