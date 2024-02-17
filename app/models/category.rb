class Category < ApplicationRecord
  has_many :styles, dependent: :destroy
end
