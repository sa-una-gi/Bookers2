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

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
end
