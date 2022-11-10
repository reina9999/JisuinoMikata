class Public::BookmarksController < ApplicationController
  
  def create
    @cook = Cook.find(params[:cook_id])
    bookmark = current_customer.bookmarks.new(cook_id: @cook.id)
    bookmark.save
  end 
  
  def destroy
    @cook = Cook.find(params[:cook_id])
    bookmark = current_customer.bookmarks.find_by(cook_id: @cook.id)
    bookmark.destroy
  end  
  
end
