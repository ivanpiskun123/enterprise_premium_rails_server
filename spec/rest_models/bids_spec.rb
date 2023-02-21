require 'rails_helper'

RSpec.describe Bid, type: :model do
  let(:worker) { create(:worker) }
  let(:premium_for_score) { create(:premium_for_score) }

  describe 'validations' do
    it { should belong_to(:premium_for_score) }
    it { should belong_to(:worker) }
    it { should belong_to(:user).optional }
  end

  describe 'statuses' do
    let(:bid) { create(:bid) }

    it 'sets status to accepted when bid is applied' do
      bid.apply!
      expect(bid.status).to eq(2)
    end

    it 'sets status to declined when bid is rejected' do
      bid.reject!
      expect(bid.status).to eq(0)
    end
  end

end
