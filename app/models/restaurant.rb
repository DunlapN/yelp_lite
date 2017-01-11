class Restaurant < ApplicationRecord
  mount_uploader :cover_photo, CoverPhotoUploader

  # Direct associations

  has_many   :tags,
             :dependent => :destroy

  has_many   :reviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
