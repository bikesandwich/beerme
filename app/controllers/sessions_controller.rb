class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_user_name(params[:user_name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:previous]
    else
      flash.now.alert = "Invalid name/password combination"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to session[:previous], :notice => "Logged out"
  end
end
