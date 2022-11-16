class UserSerializer
  include JSONAPI::Serializer
  attributes :email

  attribute :created_at do |user|
    user.created_at.to_date
  end

  belongs_to :role, meta: Proc.new { |user, params|  {role_name: user.role.name} }
  has_one :worker_image, meta: Proc.new { |user, params|  {image_url: user.worker_image.image_url} }
  belongs_to :departament, meta: Proc.new { |user, params|  {departament_name: user.departament.name,
                                                             departament_desc: user.departament.description} }
end
