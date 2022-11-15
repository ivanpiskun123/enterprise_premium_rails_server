# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord

  has_many :users

  validates :name, presence: true,uniqueness: true

end
