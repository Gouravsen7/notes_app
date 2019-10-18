require 'rails_helper'

RSpec.describe FoldersController, type: :controller do

  describe "POST #create" do
    
    context "with valid attributes" do
      it "create new folder" do
        post :create, params: { folder: attributes_for(:folder) }
        expect(Folder.count).to eq(1)
      end
    end
  end

  describe "Get #Search" do
    let!(:folder) { create(:folder, name: "folder")}

    before do
      fold = folder
      15.times do |index|
        fold = create(:folder, name: "Folder#{index+1}", parent_id: fold.id)
        Note.create!(name: "Notes#{index+1}", folder_id: fold.id)
      end
    end

    context "search folder" do
      it "search folder with keyword" do
        get :search, params: { search: "Folder12" }

        folder = Folder.unscoped.find_by(name: "Folder12")
        expect(assigns(:folders).last).to eq(folder)
        expect(assigns(:folders).last.notes.count).to eq(folder.notes.count)
      end
    end
  end
end