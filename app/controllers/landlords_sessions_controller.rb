class LandlordsSessionsController < ApplicationController
  skip_before_action :authorize, only: [:create]

  def create
    @landlord = Landlord.find_by(email: params[:email])
    if @landlord&.authenticate(params[:password])
      session[:landlord_id] = @landlord.id
      render json: @landlord, status: :created
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    session[:landlord_id] = nil
    render json: { message: "Logged out successfully" }, status: :ok
  end
end
