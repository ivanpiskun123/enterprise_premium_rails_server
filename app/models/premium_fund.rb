# == Schema Information
#
# Table name: premium_funds
#
#  id          :bigint           not null, primary key
#  fund_amount :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class PremiumFund < ApplicationRecord

  validates :fund_amount, presence: true
  validates :fund_amount, numericality: { greater_than_or_equal_to: 0 }

end
