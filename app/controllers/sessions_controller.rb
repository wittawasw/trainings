class SessionsController < ApplicationController
  def new
  end

  def create
    name = params[:name]
    password = params[:password]

    user = User.find_by(name: name)

    if (user.authenticate(password))
      flash[:notice] = "Sign In Success as: #{user.name}"

      redirect_to root_path
    else
      flash[:alert] = "Wrong"

      redirect_to new_session_path
    end
  end
end
