# frozen_string_literal: true

module Types
  class CategoryType < Types::BaseObject
    implements GraphQL::Types::Relay::Node

    description 'A category of beer styles'
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :styles, Types::StyleType.connection_type, null: false

    def styles(**_args)
      Style.all
    end

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def self.authorized?(_object, context)
      context[:current_user]
    end
  end
end
