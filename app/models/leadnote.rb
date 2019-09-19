class Leadnote < ApplicationRecord
  belongs_to :lead
  belongs_to :user
  # validates :status, inclusion: {}
end
