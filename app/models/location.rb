class Location < ApplicationRecord
  acts_as_mappable

  belongs_to :locatable, polymorphic: true
end
