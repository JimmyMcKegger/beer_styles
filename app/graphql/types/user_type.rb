# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    description 'A user of the application'
    field :id, ID, null: true
    field :name, String, null: false
    field :email, String, null: false
    field :liked_styles, [Types::StyleType], null: true
    field :active_sessions, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

    # Only visible when logged in
    def self.visible(context)
      !!context[:current_user]
    end

    def active_sessions
      object.api_client_sessions.count
    end
  end
end
