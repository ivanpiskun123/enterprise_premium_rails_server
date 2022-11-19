# == Schema Information
#
# Table name: worker_achievements
#
#  id             :bigint           not null, primary key
#  is_active      :boolean          default(TRUE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  achievement_id :bigint
#  worker_id      :bigint
#
# Indexes
#
#  index_worker_achievements_on_achievement_id  (achievement_id)
#  index_worker_achievements_on_worker_id       (worker_id)
#
class WorkerAchievement < ApplicationRecord
  # is_active
  # so if bid with this worker_achievement was approved of declined -
  # it means top-manager saw this - and now it's inactive


  belongs_to :worker
  belongs_to :achievement

  before_validation :check_if_uniq_for_achiv_name, on: [:create, :update]


  def check_if_uniq_for_achiv_name
    return true if self.is_active == false

    wa = WorkerAchievement.where(is_active: true, worker: self.worker)
    as = wa.all.map{|y|  y.achievement}
    as = as.filter{|e|  e.name == self.achievement.name }

    unless as.empty?
      self.errors.add(:achievement, "Already there's such active one")
    end
    true

  end

  def disable!
    self.update(is_active: false)
  end

end
