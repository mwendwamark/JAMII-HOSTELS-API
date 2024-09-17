class StudentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :first_name, :last_name, :email, :phone_number, :password, :password_confirmation #:image_url

  # def image_url
  #   if object.image.attached?
  #     rails_blob_url(object.image, only_path: true)
  #   end
  # end
end
