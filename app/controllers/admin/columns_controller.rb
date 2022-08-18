class Admin::ColumnsController < ApplicationController
  def index
    @columns = Column.all.page(params[:page]).per(10)
  end

  def new
    @column = Column.new
  end

  def create
    @column = Column.new(column_params)
    if @column.save
      redirect_to admin_column_path(@column)
      flash[:notice] = '新しいコラムを登録しました。'
    else
    render "new"
    end
  end

  def show
    @column = Column.find(params[:id])
  end

  def edit
    @column = Column.find(params[:id])
  end

  def update
    @column = Column.find(params[:id])
    if @column.update(column_params)
      redirect_to admin_column_path(@column.id)
      flash[:notice] = 'コラムを編集しました'
    else
      render :"show"
    end
  end
  
  def destroy
    @column = Column.find(params[:id])
    @column.destroy
    redirect_to admin_columns_path
  end

  private
  
  def column_params
  	params.require(:column).permit(:title,:body,:is_active,:image)
  end

end
