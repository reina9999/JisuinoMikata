class Admin::CookCommentsController < ApplicationController
  def destroy
    CookComment.find(params[:id]).destroy
    @cook_comment= CookComment.new
    @cook = Cook.find(params[:cook_id])
  end
end
