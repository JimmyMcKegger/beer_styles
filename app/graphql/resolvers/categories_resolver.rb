module Resolvers
  class CategoriesResolver < BaseResolver
    type Types::CategoryType, null: false
    argument :id, ID

    def resolve(id:)
      ::Category.find(id)
    end
  end
end
