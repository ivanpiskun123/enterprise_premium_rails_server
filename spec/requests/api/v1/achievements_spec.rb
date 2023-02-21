require 'rails_helper'

RSpec.describe Api::V1::AchievementsController, type: :controller do
  describe 'GET #index' do
    let!(:achievements) { create_list(:achievement, 3) }

    before { get :index }

    it 'returns a success response' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns all achievements as json' do
      expected_json = AchievementSerializer.new(achievements).serializable_hash.to_json
      expect(response.body).to_not eq(nil)
    end
  end
end
