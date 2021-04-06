class User < ActiveRecord::Base
  has_secure_password
  validates :email,  presence: true, uniqueness: { case_sensitive: false }
  validates :first_name,  presence: true, length: { minimum: 3 }
  validates :last_name,  presence: true, length: { minimum: 3 }
  validates :password,  presence: true, length: { in: 6..20 }
end