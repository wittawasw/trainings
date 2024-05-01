class ApplicationController < ActionController::Base
  def authenticate!
    unless session[:user_id].blank?
      @current_user = User.find(session[:user_id])
    else
      flash[:alert] = "You need to sign in"
      redirect_to sign_in_path
    end
  end
end
