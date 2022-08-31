class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.where(status: "1")
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to public_user_path(current_user)
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to public_users_path
  end
  
  def user_columns
    @user = User.find(params[:id])
    @columns = Column.where(user_id:params[:id])
  end
  
  def user_clubs
    @user = User.find(params[:id])
    @clubs = Club.where(user_id:params[:id])
  end
  
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:column_id)
    @favorite_columns = Column.find(favorites)
  end
  
  def release
    @user = User.find(params[:id])
    @user.released! unless @user.released?
    redirect_to  edit_public_user_path(@user), notice: 'このアカウントを公開しました'
  end

  def nonrelease
    @user = User.find(params[:id])
    @user.nonreleased! unless @user.nonreleased?
    redirect_to  edit_public_user_path(@user), notice: 'このアカウントを非公開にしました'
  end
  
 private
  def user_params
    params.require(:user).permit(:name,:email,:best_score,:is_deleted)
  end
  
end
