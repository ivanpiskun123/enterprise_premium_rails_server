RSpec.describe Role, type: :model do
  subject { described_class.new(name: "admin") }

  describe "associations" do
    it { should have_many(:users) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
