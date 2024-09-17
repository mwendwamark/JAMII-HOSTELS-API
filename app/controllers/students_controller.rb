class StudentsController < ApplicationController
  skip_before_action :authorize, only: [:create]

  def index
    students = Student.all
    render json: students, status: :ok
  end

  def show
    @student = current_student
    render json: @student, status: :ok
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      session[:student_id] = @student.id
      render json: @student, status: :created
    else
      # render json: @student.errors, status: :unprocessable_entity
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  # def create
  #   @student = Student.new(student_params)
  #   if @student.save
  #     if params[:image].present?
  #       @student.image.attach(params[:image])
  #     end
  #     session[:student_id] = @student.id
  #     render json: @student, status: :created
  #   else
  #     render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

  private

  def student_params
    params.permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation, :image)
  end
end
