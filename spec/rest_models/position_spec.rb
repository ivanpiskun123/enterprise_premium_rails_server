# == Schema Information
#
# Table name: positions
#
#  id         :bigint           not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Position, type: :model do
  let(:position) { build(:position) }

  context 'associations' do
    it { expect(position).to have_many(:workers) }
  end

  context "validations" do
    it 'are passed', :aggregate_failures do
      expect(position).to validate_presence_of(:name)
    end
  end


end
