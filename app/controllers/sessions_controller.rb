class SessionsController < ApplicationController
  def new
  end

  def create
    name = params[:name]
    password = params[:password]

    user = User.find_by(name: name)

    if (!user.nil? && user.authenticate(password))
      flash[:notice] = "Sign In Success as: #{user.name}"
      session[:user_id] = user.id
      session[:user_name] = user.name

      redirect_to root_path
    else
      flash[:alert] = "Wrong"

      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil

    flash[:notice] = "Sign Out Success"

    redirect_to root_path
  end
end
