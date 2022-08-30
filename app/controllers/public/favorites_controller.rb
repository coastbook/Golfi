class Public::FavoritesController < ApplicationController
  
  
  def create
    column = Column.find(params[:column_id])
    favorite = current_user.favorites.new(column_id: column.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    column = Column.find(params[:column_id])
    favorite = current_user.favorites.find_by(column_id: column.id)
    favorite.destroy
    redirect_to request.referer
  end
  
end
