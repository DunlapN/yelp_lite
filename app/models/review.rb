class Review < ApplicationRecord
  # Direct associations

  has_many   :review_photos,
             :dependent => :destroy

  belongs_to :user

  belongs_to :restaurant

  # Indirect associations

  # Validations

end
