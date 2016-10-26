class SessionsController < ApplicationController

  def home
  end

  def login
  end

  def logging_in
    if teacher = Teacher.find_by(email: params[:email])
      if teacher.authenticate(params[:password])
        session[:teacher_id] = teacher.id
        redirect_to "/events/index"
      end
    elsif parent = Parent.find_by(email: params[:email])
      if parent.authenticate(params[:password])
        session[:parent_id] = parent.id
        redirect_to "/events/index"
      end
    else
      flash[:error] = "No user found"
      redirect_to :back
    end
  end

  def destroy
    reset_session
    redirect_to "/"
  end

end
