class Public::CooksController < ApplicationController
 before_action :authenticate_customer!
  def new
    @cook = Cook.new
  end

  def index
    @cooks = Cook.all.page(params[:page]).per(10)
  end

  def create
    @cook = Cook.new(cook_params)
    @cook.customer_id = current_customer.id
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
    params.require(:cook).permit(:image, :name, :required_time, :foods, :recipe)
  end
end
