class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admin_column_path(params[:column_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
