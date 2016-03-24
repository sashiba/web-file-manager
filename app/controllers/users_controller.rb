class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have signed up successfully"
      redirect_to @user
    else
      flash[:error] = "Error in fields."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = 'Profile updated!'
      redirect_to @user
    else
      flash[:danger] = "Error in fields."
      render :edit
    end
    debugger
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
