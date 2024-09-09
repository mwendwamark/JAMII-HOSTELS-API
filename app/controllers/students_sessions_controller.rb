class StudentsSessionsController < ApplicationController
  skip_before_action :authorize, only: [:create]

  def create
    @student = Student.find_by(email: params[:email])
    if @student&.authenticate(params[:password])
      session[:student_id] = @student.id
      render json: @student, status: :created
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    session[:student_id] = nil
    render json: { message: "Logged out successfully" }, status: :ok
  end
end
