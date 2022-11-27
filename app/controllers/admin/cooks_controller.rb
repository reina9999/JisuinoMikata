class Admin::CooksController < ApplicationController
  before_action :authenticate_admin!

  def show #レシピ詳細
    @cook = Cook.find(params[:id])
    @cook_comment = @cook.cook_comments #コメント表示
  end
end
