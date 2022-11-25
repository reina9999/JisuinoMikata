class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @content = params[:word]
    @model = "cook"
    @cooks = Cook.looks(params[:search], params[:word]).page(params[:page]).per(8)
  end
end
