class Folder < ApplicationRecord

  default_scope { where(parent_id: nil) }
  has_many :sub_folders, :class_name => "Folder", :foreign_key => "parent_id"
  has_many :notes, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
