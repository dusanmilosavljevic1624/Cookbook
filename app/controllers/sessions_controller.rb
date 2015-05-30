class SessionsController < ApplicationController
  def new

  end

  def create
    chef = Chef.find_by_email(params[:session][:email])
    if chef && chef.authenticate(params[:session][:password])
      sign_in chef
      @current_user = chef
      flash[:success] = "You are logged in"
      redirect_to recipes_path
    else
      flash.now[:danger] = "Your credentials are incorrect"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end