class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_an_admin

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_path
  end
end
