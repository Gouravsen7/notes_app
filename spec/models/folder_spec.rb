require 'rails_helper'

describe Folder do
 
  describe "" do
    subject { create(:folder)}

    it "has a valid factory" do
      expect(subject).to be_valid
    end
  end

  describe "" do

    it "association" do
  
      should have_many(:sub_folders)
      should have_many(:notes)
    end
  end
end