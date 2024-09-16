class HostelsController < ApplicationController
  private

  def hostel_params
    params.permit(:hostel_name, :location, :price_per_month, :hostel_type, :toilet, :kitchen,
                  :wifi, :study_room, :balcony, :gym, :wardrobe, :laundry_services, :avaliable_units,
                  :parking, :room_type, :hot_shower, :garden, :swimming_pool, :air_conditioner,
                  :cctv_cameras, :fire_extinguishers, :first_aid_kits, :smoke_alarm, :description,
                  :water_supply, :buy_own_tokens, :fully_furnished, :security, images: [])
  end
end
