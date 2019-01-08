class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 16 }
  validates :email, presence: true, length: { maximum: 32 },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: {minimum: 6, maximum: 24}
end
