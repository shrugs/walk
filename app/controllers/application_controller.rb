class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  def authenticate!
    raise_unauthorized! unless AdminKey.exists?(key: request.headers['Authorization'].split('Token ').last)
  end

  def current_profile
    @user ||= User.find_by!(handle: params[:handle])
  end

  def current_trip
    @trip ||= Trip.find_by!(user: current_profile, handle: params[:trip_handle])
  end

  def raise_unauthorized!
    head :unauthorized
    raise StandardError.new('Unauthorized')
  end
end
