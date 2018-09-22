class EntriesController < ApplicationController
  before_action :authenticate!, only: [:create]

  def create
    entry = Entry.create!({
      trip: current_trip,
      text: entry_params[:text],
      location: Location.new(location_params),
      images: entry_params[:images] || []
    })

    render json: entry
  end

  private

    def entry_params
      params.permit(:text)
    end

    def location_params
      params.require(:location).permit(:lat, :lng)
    end

end