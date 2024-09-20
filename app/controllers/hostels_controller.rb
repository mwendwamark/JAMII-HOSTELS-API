class HostelsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_not_found_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_unprocessable_entity_response
  before_action :authorize, only:[:show, :create,  :destroy, :index]

  def index
    hostels = Hostel.all
    render json: hostels, status: :ok
  end

  def create
    create_hostels = Hostel.create!(hostel_params)
    render json: create_hostels, status: :created
  end

  def show
    hostel = Hostel.find(params[:id])
    render json: hostel, status: :ok
  end

  def destroy
    hostel = Hostel.find(params[:id])
    hostel.destroy
  end

  private

  # def render_not_found_response
  #   render json: { error: "Hostel not found" }, status: :not_found
  # end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def hostel_params
    params.permit(:hostel_name, :location, :price_per_month, :hostel_type, :toilet, :kitchen,
                  :wifi, :study_room, :balcony, :gym, :wardrobe, :laundry_services, :avaliable_units,
                  :parking, :room_type, :hot_shower, :garden, :swimming_pool, :air_conditioner,
                  :cctv_cameras, :fire_extinguishers, :first_aid_kits, :smoke_alarm, :description,
                  :water_supply, :buy_own_tokens, :fully_furnished, :security, images: [])
  end
end
