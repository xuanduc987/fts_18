class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def new
    @user = User.new
  end

  def create
    @user = User.new create_user_params
    if @user.save
      flash[:success] = "User created!"
      redirect_to users_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find_by id: params[:id]
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update_attributes update_user_params
      flash[:success] = 'Profile updated'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_path
  end

  private
  def create_user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :role)
  end

  def update_user_params
    params.require(:user).permit :name, :email, :role
  end
end
