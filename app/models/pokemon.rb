class Pokemon < ApplicationRecord
  # needed for attaching photo during seed via cloudinary
  has_one_attached :photo
end
