# == Schema Information
#
# Table name: achievements
#
#  id          :bigint           not null, primary key
#  description :text             default(""), not null
#  name        :string           default(""), not null
#  points      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Achievement < ApplicationRecord

  has_many :worker_achievements

  validates :name, :description, presence: true
  validates :points, numericality: { greater_than_or_equal_to: 0 }

end
