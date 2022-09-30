class Public::ClubsController < ApplicationController
  before_action :authenticate_user!

  def index
    @clubs = Club.all
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    @club.user_id = current_user.id
    if @club.save
      redirect_to user_clubs_public_user_path(@club.user_id)
      flash[:notice] = '新しいクラブを登録しました。'
    else
      render action: :new
    end
  end

  def show
    @club = Club.find(params[:id])
  end

  def edit
    @club = Club.find(params[:id])
    
  end

  def update
    @club = Club.find(params[:id])
    if @club.update(club_params)
      redirect_to user_clubs_public_user_path(@club.user_id)
      flash[:notice] = 'クラブを編集しました'
    else
      render :"show"
    end
  end

  def destroy
    @club = Club.find(params[:id])
    @club.destroy
    redirect_to user_clubs_public_user_path(@club.user_id)
  end

  private

  def club_params
  	params.require(:club).permit(:club_type,:club_name,:is_active)
  end

end
