class Public::BookmarksController < ApplicationController
  def create #ブックマーク登録
    @cook = Cook.find(params[:cook_id])
    bookmark = current_customer.bookmarks.new(cook_id: @cook.id)
    bookmark.save
  end

  def destroy #ブックマーク削除
    @cook = Cook.find(params[:cook_id])
    bookmark = current_customer.bookmarks.find_by(cook_id: @cook.id)
    bookmark.destroy
  end
end
