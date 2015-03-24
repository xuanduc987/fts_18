class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
  end

  def create
    if @user.save
      flash[:success] = "User created!"
      redirect_to users_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes update_params
      flash[:success] = 'Profile updated'
      redirect_to admin_root_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_root_path
  end

  private
  def create_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation,
                                 :role, :avatar, :avatar_cache)
  end

  def update_params
    create_params.delete_if{|_, v| v.blank?}
  end
end
