class WorkerAchievementSerializer
  include JSONAPI::Serializer
  attributes :is_active

  attribute :created_at do |object|
    object.created_at.to_date
  end

  belongs_to :achievement, meta: Proc.new {|obj,p|
    {
      name: obj.achievement.name,
      description: obj.achievement.description,
      points: obj.achievement.points
    }
  }
  belongs_to :worker

end
