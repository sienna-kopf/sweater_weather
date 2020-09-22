require 'securerandom'

class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :password, require: true
  validates :api_key, uniqueness: true, presence: true
  has_secure_password

  after_validation(on: :create) do
    self.api_key = SecureRandom.base58(24)
  end
end
