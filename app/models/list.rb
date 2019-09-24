class List < ApplicationRecord
  belongs_to :user
  has_many :leadlists
  has_many :leads, through: :leadlists
end
