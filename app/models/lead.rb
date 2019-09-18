class Lead < ApplicationRecord
  has_many :leadlists
  has_many :leadnotes
  has_many :lists, through: :leadlists
  has_many :users, through: :leadnotes
end
