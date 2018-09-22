require "administrate/base_dashboard"

class EntryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    trip: Field::BelongsTo,
    location: Field::HasOne,
    images: Field::ActiveStorage,
    id: Field::Number,
    text: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :trip,
    :location,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :trip,
    :location,
    :images,
    :id,
    :text,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :trip,
    :location,
    :images,
    :text,
  ].freeze

  def permitted_attributes
    super + [images: []]
  end

  # Overwrite this method to customize how entries are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(entry)
  #   "Entry ##{entry.id}"
  # end
end
