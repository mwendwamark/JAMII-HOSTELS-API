class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  before_action :authorize

  private

  def authorize
    unless current_landlord || current_student
      render json: { errors: ["Not authorized, please login"] }, status: :unprocessable_entity
    end
  end

  def current_landlord
    @current_landlord ||= Landlord.find_by(id: session[:landlord_id])
  end

  def current_student
    @current_student ||= Student.find_by(id: session[:student_id])
  end

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
