class ParentsController < ApplicationController

  def new
  end

  def create
    parent = Parent.create(parent_params)
    if parent.save
      session[:parents_id] = parent.id
      redirect_to "/events/index"
    else
      flash[:parent_errors] = parent.errors.full_messages
      redirect_to :back
    end
  end

  private
  def parent_params
    params.require(:parent).permit(:name, :email, :password, :password_confirmation)
  end

end
