# == Schema Information
#
# Table name: workers
#
#  id             :bigint           not null, primary key
#  email          :string           default(""), not null
#  exp            :float            default(0.0), not null
#  first_name     :string           default(""), not null
#  phone_number   :string
#  second_name    :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  departament_id :bigint
#  position_id    :bigint
#
# Indexes
#
#  index_workers_on_departament_id  (departament_id)
#  index_workers_on_email           (email) UNIQUE
#  index_workers_on_position_id     (position_id)
#
# Foreign Keys
#
#  fk_rails_...  (position_id => positions.id)
#
class Worker < ApplicationRecord
  include Imagable

  belongs_to :position, foreign_key: :position_id
  belongs_to :departament, optional: true
  has_many :worker_achievements

  validates :email, presence: true, uniqueness: true
  validates :exp, numericality: {less_than: 100.0, greater_than_or_equal_to: 0.1}

  after_validation :round_exp, on: [ :create, :update ]

  def rounded_str_exp
    if exp < 1
      "<1"
    else
      "~#{exp.round}"
    end
  end

  # calculated as total points of all time / days in company (since created_at)
  def rating
    total = worker_achievements.sum{|wa| wa.achievement.points}
    days_in_company = (Time.now.to_date - created_at.to_date).to_i
    score = (total*10/days_in_company.to_f).round

    case score
    when 0..9
      0
    when 10..19
      1
    when 20..29
      2
    when 30..39
      3
    when 40..49
      4
    else
      5
    end
  end

  private

  def round_exp
    self.exp = self.exp.round(1)
  end

end
