# == Schema Information
#
# Table name: workers
#
#  id           :bigint           not null, primary key
#  email        :string           default(""), not null
#  first_name   :string           default(""), not null
#  second_name  :string           default(""), not null
#  phone_number :string
#  exp          :float            default(0.0), not null
#  positions_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Worker < ApplicationRecord

  belongs_to :position, required: true, foreign_key: :position_id

  validates :email, presence: true, uniqueness: true
  validates :exp, :inclusion => {:in => [0,100]}

  def rounded_str_exp
    if exp < 1
      "<1"
    else
      "~#{exp.round}"
    end
  end


end
