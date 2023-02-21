class Api::V1::WorkersController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if params["manager_id"].present?
      render json: {
        data: WorkerSerializer.new(User.find(params["manager_id"]).departament.workers).serializable_hash
      }, status: :ok
    else
      render json: {
        data: WorkerSerializer.new(Worker.all).serializable_hash
      }, status: :ok
    end

  end


  def deactivate_achievements
    begin
      Worker.find(params["id"]).worker_achievements.each(&:disable!)
      render json: {
        data: "done"
      }, status: :ok
    rescue
      render json: {
        error: "error", code: 400
      }, status: :ok
    end
  end


end
