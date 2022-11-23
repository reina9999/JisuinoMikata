class Public::CooksController < ApplicationController
 before_action :authenticate_customer!
  def new
    @cook = Cook.new
    @tags = Tag.all
  end

  def index
    @cooks = Cook.all
    @tags = Tag.all

    # logic for tag search
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @cooks = @cooks.where(tag_id: @tag.id)
    end

    @cooks = @cooks.page(params[:page]).per(8)

    # @tag = Tag.find(params[:id])
    # @cook = Cook.find(params[:id])
    # @customer = @cook.customer
  end

  def show
    @cook = Cook.find(params[:id])
    @cook_comment = CookComment.new
    # @tag = Tag.find(params[:tag_id])
  end

  def edit
    @cook = Cook.find(params[:id])
    @tag =  Tag.find(@cook.tag_id)
  end

  def create
    @cook = Cook.new(cook_params)
    @cook.customer_id = current_customer.id
    if @cook.save
      redirect_to cooks_path,notice: "You have created cook successfully."
    else
      @cooks = Cook.all
      @tags = Tag.all
      render 'new'
    end
  end

  def update
    @cook = Cook.find(params[:id])
    if @cook.update(cook_params)
      redirect_to cook_path(@cook)
    else
      render :edit
    end
  end

  def destroy
    @cook = Cook.find(params[:id])
    @cook.destroy
    redirect_to cooks_path
  end


  private
  def cook_params
    params.require(:cook).permit(:image, :name, :required_time, :foods, :recipe, :tag_id)
  end
end
