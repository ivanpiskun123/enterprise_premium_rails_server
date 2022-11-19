class Api::V1::PremiumForScoresController < ApplicationController

  def index

  end

  def minimal_premium
    render json: {
      data: PremiumForScoreSerializer.new(PremiumForScore.find_by(score: PremiumForScore.minimum(:score))).serializable_hash
    }, status: :ok
  end

end
