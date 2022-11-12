class Public::CookCommentsController < ApplicationController
  def create
    @cook = Cook.find(params[:cook_id])
    comment = current_customer.cook_comments.new(cook_comment_params)
    comment.cook_id = @cook.id
    comment.save
    @cook_comment = CookComment.new
  end 
  
  def destroy
    CookComment.find(params[:id]).destroy
    @cook_comment= CookComment.new
    @cook = Cook.find(params[:cook_id])
  end
  
  private

  def cook_comment_params
    params.require(:cook_comment).permit(:comment)
  end
end
