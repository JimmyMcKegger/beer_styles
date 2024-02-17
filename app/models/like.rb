# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :style
  belongs_to :user
end
