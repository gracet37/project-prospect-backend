class List < ApplicationRecord
  belongs_to :user
  has_many :leadlists, dependent: :destroy
  has_many :leads, through: :leadlists
end
