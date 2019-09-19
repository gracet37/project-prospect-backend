class Leadlist < ApplicationRecord
  belongs_to :lead
  belongs_to :list
  validates :lead_id, :list_id,  presence: true
end
