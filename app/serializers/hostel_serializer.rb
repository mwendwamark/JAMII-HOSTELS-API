# class HostelSerializer < ActiveModel::Serializer
#   attributes :id, :hostel_name, :location, :price_per_month, :hostel_type, :toilet, :kitchen,
#              :wifi, :study_room, :balcony, :gym, :wardrobe, :laundry_services, :avaliable_units,
#              :parking, :room_type, :hot_shower, :garden, :swimming_pool, :air_conditioner,
#              :cctv_cameras, :fire_extinguishers, :first_aid_kits, :smoke_alarm, :description,
#              :water_supply, :buy_own_tokens, :fully_furnished, :image_urls

#   def image_urls
#     if object.images.attached?
#       object.images.map { |image| rails_blob_url(image, only_path: true) } if object.images.attached?
#     end
#   end
# end
class HostelSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers # Add this to use rails_blob_url

  attributes :id, :hostel_name, :location, :price_per_month, :hostel_type, :toilet, :kitchen,
             :wifi, :study_room, :balcony, :gym, :wardrobe, :laundry_services, :avaliable_units,
             :parking, :room_type, :hot_shower, :garden, :swimming_pool, :air_conditioner,
             :cctv_cameras, :fire_extinguishers, :first_aid_kits, :smoke_alarm, :description,
             :water_supply, :buy_own_tokens, :fully_furnished, :image_urls

  def image_urls
    object.images.map { |image| rails_blob_url(image, only_path: true) } if object.images.attached?
  end
end
