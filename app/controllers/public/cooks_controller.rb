class Public::CooksController < ApplicationController

  def new
    @cook = Cook.new
  end

  # def index
  #   @cooks = Cooks.all.page(params[:page]).per(10)
  # end

  def create
    @cook = Cooks.new(cook_params)
    if @cook.save
      redirect_to cooks_path,notice: "You have created cook successfully."
    else
      @cooks = Cook.all
      render 'new'
    end
  end

  # def update
  #   @cook = Cook.find(params[:id])
  #   if @cook.update(cook_params)
  #     redirect_to cooks_path
  #   else
  #     render :edit
  #   end
  # end

  private
  def cook_params
    params.require(:cook).permit(:image,:name,:foods,:recipe)
  end
end
