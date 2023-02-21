RSpec.describe PremiumFund, type: :model do
  subject(:premium_fund) { described_class.new(fund_amount: 1000) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:fund_amount) }
    it { is_expected.to validate_numericality_of(:fund_amount).is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:premium_for_scores) }
  end
end
