# frozen_string_literal: true

class User < ApplicationRecord
  # relationships
  has_many :likes, dependent: :destroy
  has_many :liked_styles, through: :likes, source: :style
  has_many :api_client_sessions, dependent: :destroy

  has_secure_password

  before_save :sanitize_email
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }


  private

  def sanitize_email
    self.email = email.strip.downcase
  end
end
