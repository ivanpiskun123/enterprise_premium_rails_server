class PremiumForScoreSerializer
  include JSONAPI::Serializer

  attributes :amount, :score

end
