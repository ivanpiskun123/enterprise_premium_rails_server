class Api::V1::WorkerAchievementsController < ApplicationController
  def index
    render json: {
      data: WorkerAchievementSerializer.new(WorkerAchievement.where(worker_id: params["id"], is_active: params["isActive"])).serializable_hash
    }, status: :ok
  end

  def create
    wa = WorkerAchievement.new(achievement_id: params["ach"]["achiv_id"], worker_id: params["ach"]["worker_id"])

    if wa.valid? and wa.save!
      render json: {
        data: WorkerAchievementSerializer.new(wa).serializable_hash
      }, status: :ok
    else
      render json: {status: "error", code: 400,
                    client_message: "Please check if typed data is correct",
                    error_message: wa.errors}
    end

  end

end

