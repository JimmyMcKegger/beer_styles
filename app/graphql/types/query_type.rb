# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: 'Fetches an object given its ID.' do
      argument :id, ID, required: true, description: 'ID of the object.'
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, { null: true }], null: true,
                                                     description: 'Fetches a list of objects given a list of IDs.' do
      argument :ids, [ID], required: true, description: 'IDs of the objects.'
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Authentication

    field :login, String, null: true, description: 'Login a user' do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      return unless (user = User.where(email:).first&.authenticate(password))

      user.api_client_sessions.create.key
    end

    field :current_user, Types::UserType, null: true, description: 'The currently authenticated user'

    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: true, description: 'Logout the current user'

    def logout
      ApiClientSession.where(id: context[:api_client_session_id]).destroy_all
      true
    end

    field :category, Types::CategoryType, null: true do
      description 'Find a category by ID'
      argument :id, ID, required: true
    end

    def category(id:)
      Category.where(id:).first
    end

    field :categories, Types::CategoryType.connection_type, null: false

    def categories(**_args)
      Category.all
    end

    field :style, Types::StyleType, null: true do
      description 'Find a style by ID'
      argument :id, ID, required: true
    end

    def style(id:)
      Style.where(id:).first
    end

    field :stylesByTag, Types::StyleType.connection_type, null: true do
      description 'Find styles by tag'
      argument :tag, String, required: true
    end

    def stylesByTag(tag:, **args)
      Style.where('tags LIKE ?', "%#{tag}%")
    end
  end
end
