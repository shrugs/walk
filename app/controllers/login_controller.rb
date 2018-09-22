class LoginController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch('ADMIN_NAME'), password: ENV.fetch('ADMIN_PASSWORD')

  def create
    key = AdminKey.create!

    render json: { key: key.key }
  end
end
