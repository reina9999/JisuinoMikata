class Admin::CooksController < ApplicationController
  before_action :authenticate_admin!

  def show #レシピ詳細
    @cook = Cook.find(params[:id])
    @cook_comment = @cook.cook_comments #コメント表示
  end

  # def edit 
  #   @cook = Cook.find(params[:id])
  # end

  # def update
  #   @cook = Cook.find(params[:id])
  #   if @cook.update(cook_params)
  #     redirect_to admin_cook_path(@cook)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @cook = Cook.find(params[:id])
  #   @cook.destroy
  #   redirect_to cooks_path
  # end
end
