RSpec.describe Api::V1::BidsController, type: :controller do
  let(:user) { create(:user) }
  let(:worker) { create(:worker) }
  let(:premium_for_score) { create(:premium_for_score) }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "returns all bids as JSON" do
      create_list(:bid, 3)
      get :index
      expect(JSON.parse(response.body)["data"].size).to eq(3)
    end
  end

  describe "POST #create" do
    let(:bid_attributes) { attributes_for(:bid) }

    context "with valid attributes" do
      before do
        post :create, params: { bid: bid_attributes }
      end

      it "creates a new bid" do
        expect(Bid.count).to eq(1)
      end

      it "returns a successful response" do
        expect(response).to have_http_status(:ok)
      end

      it "returns the created bid as JSON" do
        expect(JSON.parse(response.body)["data"]["attributes"]["worker-id"]).to eq(bid_attributes[:worker_id])
        expect(JSON.parse(response.body)["data"]["attributes"]["user-id"]).to eq(bid_attributes[:user_id])
        expect(JSON.parse(response.body)["data"]["attributes"]["premium-for-score-id"]).to eq(bid_attributes[:premium_for_score_id])
      end
    end

    context "with invalid attributes" do
      let(:invalid_bid_attributes) { attributes_for(:bid, worker_id: nil) }

      before do
        post :create, params: { bid: invalid_bid_attributes }
      end

      it "does not create a new bid" do
        expect(Bid.count).to eq(0)
      end

      it "returns an error response" do
        expect(response).to have_http_status(:bad_request)
      end

      it "returns an error message as JSON" do
        expect(JSON.parse(response.body)["status"]).to eq("error")
      end
    end
  end

  describe "PUT #reject" do
    let(:bid) { create(:bid) }

    before do
      put :reject, params: { id: bid.id }
    end

    it "returns a successful response" do
      expect(response).to have_http_status(:ok)
    end

    it "rejects the bid" do
      expect(bid.reload.rejected?).to eq(true)
    end

    it "returns the rejected bid as JSON" do
      expect(JSON.parse(response.body)["data"]["attributes"]["status"]).to eq("rejected")
    end
  end

  describe "PUT #apply" do
    let(:bid) { create(:bid) }
    let(:premium_fund) { create(:premium_fund) }
    let(:amount) { 100 }

    before do
      premium_fund.update(fund_amount: amount)
      put :apply, params: { id: bid.id }
    end

    it "returns a successful response" do
      expect(response).to have_http_status(:ok)
    end

    it "applies the bid" do
      expect(bid.reload.applied?).to eq(true)
    end
  end
end
