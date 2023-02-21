require 'rails_helper'

RSpec.describe Worker, type: :model do
  let(:worker) { create(:worker) }

  describe 'associations' do
    it { should belong_to(:position).with_foreign_key(:position_id) }
    it { should belong_to(:departament).optional }
    it { should have_many(:worker_achievements) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_numericality_of(:exp).is_less_than(100.0) }
    it { should validate_numericality_of(:exp).is_greater_than_or_equal_to(0.1) }
  end

  describe 'callbacks' do
    context 'when saving a new record' do
      let(:new_worker) { build(:worker, exp: 1.2345) }

      it 'rounds the exp attribute to one decimal place' do
        new_worker.save
        expect(new_worker.exp).to eq(1.2)
      end
    end

    context 'when updating an existing record' do
      it 'rounds the exp attribute to one decimal place' do
        worker.update(exp: 1.2345)
        expect(worker.exp).to eq(1.2)
      end
    end
  end

  describe '#rounded_str_exp' do
    context 'when exp is less than 1' do
      it 'returns "<1"' do
        worker.update(exp: 0.5)
        expect(worker.rounded_str_exp).to eq('<1')
      end
    end

    context 'when exp is greater than or equal to 1' do
      it 'returns "~{rounded exp}"' do
        worker.update(exp: 1.2345)
        expect(worker.rounded_str_exp).to eq('~1')
      end
    end
  end

  describe '#rating' do
    let(:achievement1) { create(:worker_achievement, worker: worker, points: 20) }
    let(:achievement2) { create(:worker_achievement, worker: worker, points: 30) }

    context 'when worker has been with the company for less than 1 day' do
      it 'returns 0' do
        expect(worker.rating).to eq(0)
      end
    end

    context 'when worker has been with the company for more than 1 day' do
      before do
        worker.update(created_at: 2.days.ago)
        achievement1
        achievement2
      end

      it 'calculates the rating based on total points of all time and days in the company' do
        expect(worker.rating).to eq(5)
      end
    end
  end
end
