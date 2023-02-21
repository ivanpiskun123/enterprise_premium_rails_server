RSpec.describe Api::V1::WorkerAchievementsController, type: :controller do
  describe "GET #index" do
    let(:worker) { FactoryBot.create(:worker) }
    let(:achievement) { FactoryBot.create(:achievement) }
    let(:active_worker_achievement) { FactoryBot.create(:worker_achievement, worker: worker, achievement: achievement, is_active: true) }
    let(:inactive_worker_achievement) { FactoryBot.create(:worker_achievement, worker: worker, achievement: achievement, is_active: false) }

    it "returns a successful response with active worker achievements" do
      get :index, params: { id: worker.id, isActive: true }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["data"].first["id"]).to eq(active_worker_achievement.id)
    end

    it "returns a successful response with inactive worker achievements" do
      get :index, params: { id: worker.id, isActive: false }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["data"].first["id"]).to eq(inactive_worker_achievement.id)
    end
  end

  describe "POST #create" do
    let(:worker) { FactoryBot.create(:worker) }
    let(:achievement) { FactoryBot.create(:achievement) }
    let(:valid_params) { { ach: { achiv_id: achievement.id, worker_id: worker.id } } }
    let(:invalid_params) { { ach: { achiv_id: nil, worker_id: nil } } }

    it "creates a new worker achievement with valid params" do
      expect {
        post :create, params: valid_params
      }.to change(WorkerAchievement, :count).by(1)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["data"]["attributes"]["achievement_id"]).to eq(achievement.id)
      expect(JSON.parse(response.body)["data"]["attributes"]["worker_id"]).to eq(worker.id)
    end

    it "returns an error response with invalid params" do
      post :create, params: invalid_params
      expect(response).to have_http_status(:bad_request)
      expect(JSON.parse(response.body)["status"]).to eq("error")
      expect(JSON.parse(response.body)["error_message"]["achievement"]).to include("must exist")
      expect(JSON.parse(response.body)["error_message"]["worker"]).to include("must exist")
    end
  end
end
