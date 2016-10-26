class TeachersController < ApplicationController

  def new
  end

  def create
    teacher = Teacher.create(teacher_params)
    if teacher.save
      session[:teacher_id] = teacher.id
      redirect_to "/events/index"
    else
      flash[:teacher_errors] = teacher.errors.full_messages
      redirect_to :back
    end
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, :password_confirmation)
  end

end
