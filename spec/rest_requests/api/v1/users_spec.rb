require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe "GET #show" do
    let!(:user) { create(:user) }

    context "when the user exists" do
      before { get :show, params: { id: user.id } }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns the user" do
        user_response = JSON.parse(response.body)["data"]["attributes"]
        expect(user_response["name"]).to eq user.name
        expect(user_response["email"]).to eq user.email
      end
    end

    context "when the user does not exist" do
      before { get :show, params: { id: 0 } }

      it "returns http not found" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "PUT #update" do
    let!(:user) { create(:user) }
    let(:valid_attributes) { { name: "new name" } }
    let(:invalid_attributes) { { name: "" } }

    context "when the user exists and the request is valid" do
      before { put :update, params: { id: user.id, user: valid_attributes } }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "updates the user" do
        expect(user.reload.name).to eq "new name"
      end
    end

    context "when the user exists but the request is invalid" do
      before { put :update, params: { id: user.id, user: invalid_attributes } }

      it "returns http bad request" do
        expect(response).to have_http_status(:bad_request)
      end

      it "does not update the user" do
        expect(user.reload.name).not_to eq ""
      end
    end

    context "when the user does not exist" do
      before { put :update, params: { id: 0 } }

      it "returns http not found" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
