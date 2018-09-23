class TripChannel < ApplicationCable::Channel
  def subscribed
    stream_from current_trip.channel_id
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def current_trip
    @trip ||= Trip.find_by!(handle: params[:trip_handle])
  end
end
