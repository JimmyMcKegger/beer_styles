# frozen_string_literal: true

class ApiClientSession < ApplicationRecord
  belongs_to :user

  before_create do
    self.key = SecureRandom.hex(16)
  end
end
