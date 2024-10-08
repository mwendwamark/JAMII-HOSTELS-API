class LandlordsController < ApplicationController
  skip_before_action :authorize, only: [:create]

  def index
    landlords = Landlord.all
    render json: landlords, status: :ok
  end

  def show
    @landlord = current_landlord
    render json: @landlord, status: :ok
  end

  def create
    @landlord = Landlord.new(landlord_params)
    if @landlord.save
      session[:landlord_id] = @landlord.id
      render json: @landlord, status: :created
    else
      # render json: @landlord.errors, status: :unprocessable_entity
      render json: { errors: @landlord.errors.full_messages }, status: :unprocessable_entity
    end
  end
  # def create
  #   @landlord = Landlord.new(landlord_params)
  #   if @landlord.save
  #     if params[:image].present?
  #       @landlord.image.attach(params[:image])
  #     end
  #     session[:landlord_id] = @landlord.id
  #     render json: @landlord, status: :created
  #   else
  #     render json: { errors: @landlord.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

  private

  def landlord_params
    params.permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation, :image)
  end
end
