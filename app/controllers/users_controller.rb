class UsersController < ApplicationController
   before_action :correct_user,only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @users = User.all
    @book = Book.new
  end

  def destroy
  end

  def update
    @user = User.find(params[:id])
    flash[:notice] = "You have updated user successfully."
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])

  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
       redirect_to user_path(current_user)
    end
  end
end