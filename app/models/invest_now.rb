class InvestNow < ApplicationRecord
  validates :first_name, presence: true
  validates_format_of :phone_number, :with => /[0-9]{9}/
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
