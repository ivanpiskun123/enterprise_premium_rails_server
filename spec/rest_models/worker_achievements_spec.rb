RSpec.describe WorkerAchievement, type: :model do
  describe "validations" do
    it { should belong_to(:worker) }
    it { should belong_to(:achievement) }
  end

  describe "methods" do
    describe "#check_if_uniq_for_achiv_name" do
      let(:worker) { create(:worker) }
      let(:achievement1) { create(:achievement, name: "Achievement 1") }
      let(:achievement2) { create(:achievement, name: "Achievement 2") }
      let!(:worker_achievement1) { create(:worker_achievement, worker: worker, achievement: achievement1, is_active: true) }

      it "should not allow creating two active achievements with the same name for the same worker" do
        worker_achievement2 = WorkerAchievement.new(worker: worker, achievement: achievement1, is_active: true)
        expect(worker_achievement2).not_to be_valid
        expect(worker_achievement2.errors[:achievement]).to include("Already there's such active one")
      end

      it "should allow creating two active achievements with the same name for different workers" do
        worker_achievement2 = WorkerAchievement.new(worker: create(:worker), achievement: achievement1, is_active: true)
        expect(worker_achievement2).to be_valid
      end

      it "should allow creating two inactive achievements with the same name for the same worker" do
        worker_achievement2 = WorkerAchievement.new(worker: worker, achievement: achievement1, is_active: false)
        expect(worker_achievement2).to be_valid
      end

      it "should allow creating two active achievements with different names for the same worker" do
        worker_achievement2 = WorkerAchievement.new(worker: worker, achievement: achievement2, is_active: true)
        expect(worker_achievement2).to be_valid
      end
    end

    describe "#disable!" do
      let!(:worker_achievement) { create(:worker_achievement, is_active: true) }

      it "should disable the worker achievement" do
        worker_achievement.disable!
        expect(worker_achievement.reload.is_active).to be_falsey
      end
    end
  end
end
