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
FactoryBot.define do
  factory :worker do
    association :position
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    second_name { Faker::Name.last_name }
    exp { 0.4 }
  end
end
