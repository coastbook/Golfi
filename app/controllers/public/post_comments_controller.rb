class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    column = Column.find(params[:column_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.column_id = column.id
    comment.save
    redirect_to public_column_path(column)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to public_column_path(params[:column_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
