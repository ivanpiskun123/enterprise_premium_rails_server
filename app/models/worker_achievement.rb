# == Schema Information
#
# Table name: worker_achievements
#
#  id             :bigint           not null, primary key
#  is_credited    :boolean          default(FALSE), not null
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

  belongs_to :worker
  belongs_to :achievement

end
