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
        return
      end
    elsif parent = Parent.find_by(email: params[:email])
      if parent.authenticate(params[:password])
        session[:parent_id] = parent.id
        redirect_to "/events/index"
        return
      end
    end
    flash[:error] = "Invalid user credentials"
    redirect_to "/"
  end

  def destroy
    reset_session
    redirect_to "/"
  end

end
