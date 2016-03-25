class FilesController < ApplicationController
  before_action :logged_in_user

  def show 
    @file = UserFile.find(params[:id])
  end

  def index
    @files = User.find(params[:user_id]).user_files.all
  end

  def new
    @user = User.find(params[:user_id])
    @file = @user.user_files.build
  end

  def create
    @user = User.find(params[:user_id])
    if @file = @user.user_files.create(file_params)
      redirect_to user_file_path(@user, @file)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @user.user_files.find(params[:id]).remove_file!
    @user.user_files.find(params[:id]).destroy
    @user.save
    redirect_to @user
  end


  private

  def file_params
    params.require(:user_file).permit(:user_id, :file)
  end
end
