# frozen_string_literal: true

module Types
  class WorkerImageType < Types::BaseObject
    field :id, ID, null: false
    field :image_url, String, null: false
    field :reference_type, String
    field :reference_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
