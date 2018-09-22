class TripsController < ApplicationController
  before_action :authenticate!, only: [:create]

  def show
    render json: current_trip.full
  end

  def create
    trip = current_profile.trips.create!(create_params)

    render json: trip
  end

  private

    def create_params
      params.permit(:name)
    end

end
