class FoldersController < ApplicationController

  before_action :set_folder, only: [:destroy, :show]

  def index
    @folders = Folder.all
    @notes = Note.all
  end

  def show
    @folders = @folder.sub_folders
    @notes = @folder.notes
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)
    if @folder.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @folder.destroy
    redirect_to root_path
  end

  def search
    @folders = Folder.unscoped.where('lower(name) LIKE ?', "%#{params['search'].downcase}%")
  end

  private

    def set_folder
      @folder = Folder.unscoped.find(params[:id])
    end

    def folder_params
      params.require(:folder).permit(:name, :parent_id)
    end
end
