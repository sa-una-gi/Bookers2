class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @book = Book.new
  	@user = User.find(params[:id])
  end

  def index
    @users = User.all.order(created_at: :desc)
    @book = Book.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
      @user = current_user
    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
end
