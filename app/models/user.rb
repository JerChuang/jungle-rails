class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => { :case_sensitive => false }
  validates :password_digest, presence: true
  validates :password, length: {minimum: 8}
  validates :password_confirmation, length: {minimum: 8}

end

