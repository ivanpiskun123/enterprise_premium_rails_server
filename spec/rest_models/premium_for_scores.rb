RSpec.describe PremiumForScore, type: :model do
  describe "validations" do
    it "is valid with a positive amount and score" do
      premium_for_score = build(:premium_for_score, amount: 100, score: 10)
      expect(premium_for_score).to be_valid
    end

    it "is invalid with a non-positive amount" do
      premium_for_score = build(:premium_for_score, amount: 0, score: 10)
      expect(premium_for_score).to_not be_valid

      premium_for_score = build(:premium_for_score, amount: -1, score: 10)
      expect(premium_for_score).to_not be_valid
    end

    it "is invalid with a non-positive score" do
      premium_for_score = build(:premium_for_score, amount: 100, score: 0)
      expect(premium_for_score).to_not be_valid

      premium_for_score = build(:premium_for_score, amount: 100, score: -1)
      expect(premium_for_score).to_not be_valid
    end
  end
end
