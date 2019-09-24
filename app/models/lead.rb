class Lead < ApplicationRecord
  has_many :leadlists, dependent: :destroy
  has_many :leadnotes, dependent: :destroy
  has_many :lists, through: :leadlists
  has_many :users, through: :leadnotes
  validates :email, uniqueness: true
end
