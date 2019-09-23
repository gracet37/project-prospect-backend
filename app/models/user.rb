class User < ApplicationRecord
  has_many :leadnotes, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_many :leads, through: :leadnotes
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :first_name, :last_name, :email, presence: true, length: {minimum: 2}
  validates :password, length: {in: 6..20}
end


