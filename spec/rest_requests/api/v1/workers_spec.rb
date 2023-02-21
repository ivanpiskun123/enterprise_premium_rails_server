RSpec.describe Api::V1::WorkersController, type: :controller do
  describe "GET index" do
    context "when manager_id is present" do
      let(:manager) { create(:user) }
      let!(:worker) { create(:worker, departament: manager.departament) }

      before do
        get :index, params: { manager_id: manager.id }
      end

      it "returns a successful response" do
        expect(response).to have_http_status(:ok)
      end

      it "returns the workers belonging to the manager's department" do
        expect(JSON.parse(response.body)["data"][0]["attributes"]["id"]).to eq(worker.id)
      end
    end

    context "when manager_id is not present" do
      let!(:worker) { create(:worker) }

      before do
        get :index
      end

      it "returns a successful response" do
        expect(response).to have_http_status(:ok)
      end

      it "returns all workers" do
        expect(JSON.parse(response.body)["data"][0]["attributes"]["id"]).to eq(worker.id)
      end
    end
  end

  describe "PUT deactivate_achievements" do
    let!(:worker) { create(:worker) }
    let!(:achievement) { create(:worker_achievement, worker: worker) }

    before do
      put :deactivate_achievements, params: { id: worker.id }
    end

    it "returns a successful response" do
      expect(response).to have_http_status(:ok)
    end

    it "deactivates all worker's achievements" do
      expect(worker.worker_achievements.first.is_active).to be(false)
    end

    context "when worker_id is invalid" do
      before do
        put :deactivate_achievements, params: { id: 999 }
      end

      it "returns a 400 status code" do
        expect(response).to have_http_status(400)
      end

      it "returns an error message" do
        expect(JSON.parse(response.body)).to include("error" => "error", "code" => 400)
      end
    end
  end
end
