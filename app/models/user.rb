class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :password, require: true
  validates :api_key, uniqueness: true, presence: true
  has_secure_password

  after_validation :user do
    self.api_key = Rails.application.secrets.secret_key_base
    self.save
  end
end
