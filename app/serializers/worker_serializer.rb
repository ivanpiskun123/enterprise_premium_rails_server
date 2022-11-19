class WorkerSerializer
  include JSONAPI::Serializer
  attributes :email, :first_name,
             :second_name, :phone_number, :exp

  attribute :created_at do |candidate|
    candidate.created_at.to_date
  end

  attribute :rating, &:rating

  belongs_to :position, meta: Proc.new { |object, params|  {position_name: object.position.name} }
  belongs_to :departament, meta: Proc.new { |object, params|  {departament_name: object.departament.name} }

  meta do |object|
    {
    chief_email: object.departament.user.email,
    image_url: object.worker_image.image_url
    }
  end

  has_many :worker_achievements

end
