class User < ApplicationRecord
  has_secure_password

  has_many :todos
  validates :email, uniqueness: true , presence: true
  validates :nickname, presence: true
  validates :name, presence: true
  validates :password, presence: true
end
