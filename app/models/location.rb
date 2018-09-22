class Location < ApplicationRecord
  acts_as_mappable

  belongs_to :locatable, polymorphic: true

  def full
    {
      id: self.id,
      lat: self.lat,
      lng: self.lng,
    }
  end
end
