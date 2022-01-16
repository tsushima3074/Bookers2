class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @book = Book.new
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "1 error prohibited this obj from being saved:."
      render :edit
    end
  end

  def index
    @book = Book.new
    @user = User.find(current_user.id)
    @users = User.all
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
