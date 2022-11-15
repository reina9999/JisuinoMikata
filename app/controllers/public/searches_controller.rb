class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @content = params[:word]
    @model = "cook"
    @cooks = Cook.looks(params[:search], params[:word])
  end

end
