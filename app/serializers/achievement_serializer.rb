class AchievementSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :points
end
