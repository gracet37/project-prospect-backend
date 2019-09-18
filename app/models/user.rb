class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  has_many :leadnotes
  has_many :lists
  has_many :leads, through: :leadnotes
  has_secure_password
  validates :email, uniqueness: true, presence: true, email: true
  validates :first_name, :last_name, presence: true, length: {minimum: 2}
  validates :password, length: {in: 6..20}
end


