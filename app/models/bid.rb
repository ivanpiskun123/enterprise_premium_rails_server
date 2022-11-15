# == Schema Information
#
# Table name: bids
#
#  id                   :bigint           not null, primary key
#  approved_at          :datetime
#  status               :boolean          default(FALSE), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  premium_for_score_id :bigint
#  user_id              :bigint
#  worker_id            :bigint
#
# Indexes
#
#  index_bids_on_premium_for_score_id  (premium_for_score_id)
#  index_bids_on_user_id               (user_id)
#  index_bids_on_worker_id             (worker_id)
#
class Bid < ApplicationRecord

  belongs_to :premium_for_score
  belongs_to :worker
  # approved_by
  belongs_to :user, optional: true

  
  def approve!
    self.status = true
    self.approved_at = Time.now
    self.save
  end

end
