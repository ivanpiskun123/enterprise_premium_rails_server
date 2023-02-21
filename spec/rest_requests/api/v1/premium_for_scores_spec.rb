require 'rails_helper'

RSpec.describe Api::V1::PremiumForScoresController, type: :controller do

  describe "GET #minimal_premium" do
    let!(:premium_for_score1) { create(:premium_for_score, score: 10) }
    let!(:premium_for_score2) { create(:premium_for_score, score: 20) }
    let!(:premium_for_score3) { create(:premium_for_score, score: 5) }

    before do
      get :minimal_premium, params: {}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns the PremiumForScore with the minimum score" do
      expect(response.body).to include(PremiumForScoreSerializer.new(premium_for_score3).serializable_hash.to_json)
    end
  end

end
