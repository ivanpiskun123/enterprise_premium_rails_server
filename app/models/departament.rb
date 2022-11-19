# == Schema Information
#
# Table name: departaments
#
#  id          :bigint           not null, primary key
#  description :text             default(""), not null
#  name        :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Departament < ApplicationRecord

  has_many :workers
  has_one :user
  validates :name, presence: true,uniqueness: true


end
