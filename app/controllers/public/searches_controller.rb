class Public::SearchesController < ApplicationController
  def search

   @range = params[:range] #検索モデル
   @content = params[:word] #検索ワード
   @model = "cook"
  # @cooks = Cook.looks(params[:search], params[:word]).order("created_at DESC").page(params[:page]).per(8) #降順に指定


   #ソート機能
    if params[:latest]
      @cooks = Cook.looks(params[:search], params[:word]).latest.page(params[:page]).per(8)
    elsif params[:old]
      @cooks = Cook.looks(params[:search], params[:word]).old.page(params[:page]).per(8)
    elsif params[:star_count]
      @cooks = Cook.looks(params[:search], params[:word]).star_count.page(params[:page]).per(8)
    else
      @cooks = Cook.looks(params[:search], params[:word]).order("created_at DESC").page(params[:page]).per(8) #降順に指定
    end
  end
end
