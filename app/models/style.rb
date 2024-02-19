# frozen_string_literal: true

class Style < ApplicationRecord
  # relationships
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :fans, through: :likes, source: :user

  # callbacks
  before_save :set_slug

  # validations

  validates :name, presence: true, uniqueness: true

  # validates :description, length: { minimum: 25 }

  # param

  def to_param
    slug
  end

  def to_s
    "#{name} - #{bjcp_category}"
  end

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

  def self.historical
    where bjcp_category: 'Historical'
  end

  def self.uncategorised
    where(bjcp_category: nil).or(where(overall_impression: nil)).or(where(overall_impression: ''))
  end

  private

  def set_slug
    self.slug = name.parameterize
  end
end
