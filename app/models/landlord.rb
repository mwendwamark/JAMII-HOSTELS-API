class Landlord < ApplicationRecord
  has_secure_password

  has_many :hostels, dependent: :destroy
  # validations
  validates :email, :first_name, :last_name, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, length: { maximum: 64, minimum: 2 }
  validates :password, length: { minimum: 6, maximum: 64 }, if: -> { new_record? || !password.nil? }
  validates :password_confirmation, presence: true, if: -> { new_record? || !password.nil? }
  validates :phone_number, uniqueness: true, numericality: { only_integer: true }, length: { is: 10 }
  validate :email_uniqueness_across_models

  def email_uniqueness_across_models
    if Student.exists?(email: email)
      errors.add(:email, "is already taken as a student")
    end
  end
end
