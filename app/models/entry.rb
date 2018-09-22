class Entry < ApplicationRecord
  belongs_to :trip
  has_one :location, as: :locatable, dependent: :destroy
  has_many_attached :images

  def full
    {
      id: self.id,
      location: location.full,
      text: self.text,
      images: self.images.map { |image| { url: url_for(image) } }
    }
  end
end
