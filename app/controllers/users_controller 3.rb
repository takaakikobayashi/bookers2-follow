class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  def index
  	@users = User.all
    @user_id = User.find(current_user.id)
    @book = Book.new
  end
def edit
  @user = User.find(params[:id])
end
def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
  redirect_to user_path(@user.id) and return
end
else
   @users = User.all
   render action: :edit
end
private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end
    def correct_user
      user = User.find(params[:id])
      if current_user != user
        redirect_to show_user_path(current_user.id)
      end
    end
end
