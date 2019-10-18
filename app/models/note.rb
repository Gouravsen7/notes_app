class Note < ApplicationRecord

  default_scope { where(folder_id: nil) }
  belongs_to :folder, optional: true

  validates :name, presence: true, uniqueness: true
end
