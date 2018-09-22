class AdminKey < ApplicationRecord
  before_validation :create_key, on: [:create]

  private
    def create_key
      self.key = SecureRandom.hex(32)
    end
end
