class Admin::CookCommentsController < ApplicationController
  
  #管理者用コメント削除
  def destroy
    CookComment.find(params[:id]).destroy
    @cook_comment= CookComment.new
    @cook = Cook.find(params[:cook_id])
  end
end
