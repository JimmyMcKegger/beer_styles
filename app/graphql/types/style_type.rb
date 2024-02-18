class Types::StyleType < Types::BaseObject
  description "A style of beer"
  field :id, ID, null: false
  field :name, String, null: false
  field :category, Types::CategoryType, null: true
  field :description, String, null: true
  field :overall_impression, String, null: true
  field :aroma, String, null: true
  field :appearance, String, null: true
  field :flavor, String, null: true
  field :mouthfeel, String, null: true
  field :history, String, null: true
  field :comments, String, null: true
  field :vital_statistics, String, null: true
  field :commercial_examples, String, null: true
  field :tags, String, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
end
