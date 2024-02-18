class Types::CategoryType < Types::BaseObject
  description "A category of beer styles"
  field :id, ID, null: false
  field :name, String, null: false
  field :description, String, null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
end
