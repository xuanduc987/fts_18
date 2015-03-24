class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def check_admin
    return if current_user.is_admin?
    flash[:warning] = "You don't have permission!"
    redirect_to root_url
  end
end
