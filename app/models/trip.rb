require 'base62-rb'

MAXIMUM_LENGTH = 64
LENGTH_OF_UNIQUE_ID = 10

class Trip < ApplicationRecord
  before_validation :assign_handle, on: :create

  belongs_to :user
  has_many :entries, -> { includes :location }, dependent: :destroy

  enum status: {
    active: 0,
    inactive: 1,
  }

  scope :only_active, -> { where :status, Trip.statuses[:active] }
  scope :only_inactive, -> { where :status, Trip.statuses[:inactive] }

  validates :name,
    presence: true

  validates :handle,
    presence: true,
    uniqueness: true

  def channel_id
    "trip_#{handle}"
  end

  def sample
    {
      id: self.id,
      name: self.name,
      handle: self.handle,
      status: self.status,
    }
  end

  def full
    sample.merge({
      entries: self.entries.map(&:full)
    })
  end

  private

    def assign_handle
      self.handle = valid_handle_for_text(name)
    end

    def valid_handle_for_text(text)
      loop do
        handle = handle_for_text(text)
        break handle unless handle_exists?(handle)
      end
    end

    def handle_for_text(text)
      "#{text.truncate(MAXIMUM_LENGTH - LENGTH_OF_UNIQUE_ID)}-#{unique_id}".parameterize
    end

    def unique_id
      Base62.encode(rand(1e15...1e16).to_i)
    end

    def handle_exists?(handle)
      Trip.exists?(handle: handle)
    end
end
