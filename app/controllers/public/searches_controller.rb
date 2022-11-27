class Public::SearchesController < ApplicationController
  def search
    @range = params[:range] #検索モデル
    @content = params[:word] #検索ワード
    @model = "cook"
    @cooks = Cook.looks(params[:search], params[:word]).order("created_at DESC").page(params[:page]).per(8) #降順に指定
  end
end
