class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_an_admin

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "User created!"
      redirect_to users_path
    else
      render "new"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :role)
  end
end
