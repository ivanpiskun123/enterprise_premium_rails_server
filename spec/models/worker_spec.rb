# == Schema Information
#
# Table name: workers
#
#  id           :bigint           not null, primary key
#  email        :string           default(""), not null
#  first_name   :string           default(""), not null
#  second_name  :string           default(""), not null
#  phone_number :string
#  exp          :float            default(0.0), not null
#  positions_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Worker, type: :model do
  let(:worker) {build(:worker)}

  context 'associations' do
    it { expect(worker).to belong_to(:position).optional(false) }
  end

  context 'validations' do
    it 'are passed', :aggregate_failures do
      expect(worker).to validate_inclusion_of(:exp).in_range(0..100)
      expect(worker).to validate_presence_of(:email)
    end
  end

  context 'representation methods' do
    describe "#rounded_str_exp" do
      it "returns rounded stringified value for exp", :aggregate_failures do
        expect(worker.rounded_str_exp).to eq('<1')
        expect(build(:worker, exp: 0.999).rounded_str_exp).to eq('<1')
        expect(build(:worker, exp: 1).rounded_str_exp).to eq('~1')
        expect(build(:worker, exp: 1.499).rounded_str_exp).to eq('~1')
        expect(build(:worker, exp: 1.5).rounded_str_exp).to eq('~2')
      end

    end
  end

end
