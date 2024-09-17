class Student < ApplicationRecord
  has_secure_password

  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # has_one_attached :image

  # validations
  validates :email, :first_name, :last_name, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, length: { maximum: 64, minimum: 2 }
  validates :password, length: { minimum: 6, maximum: 64 }, if: -> { new_record? || !password.nil? }
  validates :password_confirmation, presence: true, if: -> { new_record? || !password.nil? }
  validates :phone_number, uniqueness: true, numericality: { only_integer: true }, length: { is: 10 }

  # custom validations
  validate :email_uniqueness_across_models
  validate :phone_number_uniqueness_across_models

  private

  def email_uniqueness_across_models
    if Landlord.exists?(email: email)
      errors.add(:email, "is already taken as a landlord")
    end
  end

  def phone_number_uniqueness_across_models
    if Landlord.exists?(phone_number: phone_number)
      errors.add(:phone_number, "is already taken as a landlord")
    end
  end
end
