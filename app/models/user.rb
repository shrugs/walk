class User < ApplicationRecord
  validates :handle,
    uniqueness: true

  has_many :trips, dependent: :destroy
end
