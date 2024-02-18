# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :styles, dependent: :destroy
end
