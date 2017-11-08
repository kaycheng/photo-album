class Album < ApplicationRecord
  mount_uploader :photo, PhotoImageUploader
  validates_presence_of :title

end
