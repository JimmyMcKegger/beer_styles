# frozen_string_literal: true

class Style < ApplicationRecord
  def to_s
    "#{name} - #{bjcp_category}"
  end

  # validations

  validates :name, presence: true

  validates :description, length: { minimum: 25 }

  # associations

  def self.american
    where(country: 'U.S.A.')
  end

  def self.german
    where(country: 'Germany')
  end

  def self.british
    where(country: 'U.K.')
  end

  def self.belgian
    where(country: 'Belgium')
  end
end
