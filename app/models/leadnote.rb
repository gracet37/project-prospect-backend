class Leadnote < ApplicationRecord
  belongs_to :lead
  belongs_to :user
  has_many :comments, dependent: :destroy
  # validates :status, inclusion: {}
end
