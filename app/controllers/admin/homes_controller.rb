class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @cooks = Cook.all.order("created_at DESC").page(params[:page]).per(10) #降順に指定
  end
end
