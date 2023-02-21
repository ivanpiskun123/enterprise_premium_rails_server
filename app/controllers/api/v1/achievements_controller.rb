class Api::V1::AchievementsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    render json: {
      data: AchievementSerializer.new(Achievement.all).serializable_hash
    }, status: :ok
  end
end
