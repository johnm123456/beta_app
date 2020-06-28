 class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 5, maximum: 15 }
  VALID_SAVE_FORMAT_FOR_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 50 },
            format: { with: VALID_SAVE_FORMAT_FOR_EMAIL }
  has_secure_password
 end
