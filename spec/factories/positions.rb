# == Schema Information
#
# Table name: positions
#
#  id         :bigint           not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :position, class: Position do
    name {'Программист'}
  end
end
