class NotesController < ApplicationController

  before_action :set_note, only: [:destroy]

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  private

    def set_note
      @note = Note.unscoped.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:name, :folder_id)
    end

end
