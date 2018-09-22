class Entry < ApplicationRecord
  belongs_to :trip
  has_one :location, as: :locatable, dependent: :destroy
  has_many_attached :images
end
