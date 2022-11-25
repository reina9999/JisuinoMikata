class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @cooks = Cook.all.page(params[:page]).per(10)
  end
end
