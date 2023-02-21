class Api::V1::BidsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    render json: {
      data: BidSerializer.new(Bid.all).serializable_hash
    }, status: :ok
  end

  def create

    sum_points = params["bid"]["sum_points"].to_i

    p = PremiumForScore.all.map do |ps|
      [ps.id, sum_points - ps.score]
    end
    p = p.filter{|y| y[1]>=0 }
    p1 = p.map{|t| t[1]}.min
    ps_id = p.find{|y| y[1] == p1 }.first

    b = Bid.new(worker_id: params["bid"]["worker_id"],
                user_id: params["bid"]["user_id"],
                premium_for_score_id: ps_id
                )

    if b.save!
      render json: {
        data: BidSerializer.new(b).serializable_hash
      }, status: :ok
    else
      render json: {status: "error", code: 400,
                    client_message: "Please check if typed data is correct",
                    error_message: b.errors}
    end

  end

  def reject
    b = Bid.find(params["id"])
    b.reject!
    render json: {
      data: BidSerializer.new(b).serializable_hash
    }, status: :ok
  end

  def apply
    b = Bid.find(params["id"])
    pa = PremiumFund.last.fund_amount
    PremiumFund.last.update(fund_amount: pa-b.premium_for_score.amount)
    b.apply!
    render json: {
      data: BidSerializer.new(b).serializable_hash
    }, status: :ok
  end

end
