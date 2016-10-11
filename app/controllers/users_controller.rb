class UsersController < ApplicationController
  #attr_accessors :name, :email

  def show
    @user = User.find(params[:id]) #gets the users/1 paramaters
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #Handle a successful save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
