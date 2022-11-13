# == Schema Information
#
# Table name: positions
#
#  id         :bigint           not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Position < ApplicationRecord

  has_many :workers
  validates :name, presence: true, uniqueness: true

end

