class List < ApplicationRecord
  belongs_to :user_id
  has_many :leads, through: :leadlists
end
