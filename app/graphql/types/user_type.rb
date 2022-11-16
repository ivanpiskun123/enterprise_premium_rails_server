# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :encrypted_password, String, null: false
    field :jti, String, null: false
    field :reset_password_token, String
    field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601Date, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :role_id, Integer
    field :role, Types::RoleType
    field :departament_id, Integer
    field :departament, Types::DepartamentType
    field :workers_count, Integer
    field :worker_image, Types::WorkerImageType

    def created_at
      object.created_at.to_date
    end

    def workers_count
      object.departament.workers.count
    end
  end
end
