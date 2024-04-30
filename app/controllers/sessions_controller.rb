class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
               .authenticate(params[:password])

    if user
      flash[:notice] = "Sign In Success."

      redirect_to root_path
    else
      flash[:alert] = "Sign In Failed."

      redirect_to sign_in_path
    end
  end
end
