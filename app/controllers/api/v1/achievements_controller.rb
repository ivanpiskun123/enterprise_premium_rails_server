class Api::V1::AchievementsController < ApplicationController
  def index
    render json: {
      data: AchievementSerializer.new(Achievement.all).serializable_hash
    }, status: :ok
  end
end
