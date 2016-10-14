class UsersController < ApplicationController
  #attr_accessors :name, :email
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    #@user = User.all
    if signed_in?
      @users = User.paginate(page: params[:page]) #params[:page] -default to 30 , :per_page => 20
    else
        signed_in_user
    end
  end

  def show
    @user = User.find(params[:id])                #gets the users/1 paramaters
  end

  def new
    if !signed_in?
      @user = User.new
    else
      redirect_to current_user
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #Handle a successful save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    # @user = User.find(params[:id]) #
  end

  def update
    # @user = User.find(params[:id]) 
    if @user.update_attributes(user_params) #user_params is used to prevent mass assignment vulnerability
      # Handle a succesful update
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:admin, :name, :email, :password, :password_confirmation)
    end

    #Before filters
    def signed_in_user
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
