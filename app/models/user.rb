class User < ActiveRecord::Base
  has_secure_password

  validates :email,  presence: true, uniqueness: { case_sensitive: false }
  validates :first_name,  presence: true, length: { minimum: 3 }
  validates :last_name,  presence: true, length: { minimum: 3 }
  validates :password,  presence: true, length: { in: 6..20 }
  before_save { self.email.downcase!}

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    @user = User.find_by_email(email.downcase.strip)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
