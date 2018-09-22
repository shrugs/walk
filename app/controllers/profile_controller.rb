class ProfileController < ApplicationController

  def index
    @profiles = User.first(10)
  end

  def show
    @profile = current_profile
    # @active_trip = current_profile.trips.active.first
    # @archived_trips = current_profile.trips.archived.all

    render json: {
      profile: @profile,
      trips: @profile.trips
    }
  end

end
