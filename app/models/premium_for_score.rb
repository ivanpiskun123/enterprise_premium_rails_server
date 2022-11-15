# == Schema Information
#
# Table name: premium_for_scores
#
#  id         :bigint           not null, primary key
#  amount     :integer          not null
#  score      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PremiumForScore < ApplicationRecord
  validates :amount, :score, numericality: { greater_than_or_equal_to: 1 }
end
