class Api::V1::UsersController < ApplicationController

  def show
    render json: {
      data: UserSerializer.new(User.find(params["id"])).serializable_hash
    }, status: :ok
  end

  def update
    puts "\n\n#{params}\n\n"
  end

end
