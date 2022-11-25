class Public::MenusController < ApplicationController
  def index
    @random_menu = RandomMenu.new
    @random_menus = RandomMenu.where(customer_id: current_customer.id)
  end

  def create
    if Rails.env.development?
      # SQLite用のRANDOM (DEVELOPMENT)
      @cooks = Cook.order("random()").take(7)
    else
      # MySQL用のRANDOM (PRODUCTION)
      @cooks = Cook.order("RAND()").take(7)
    end

    # 7件以下の場合エラーを出さないために処理
    if @cooks.count < 7
      redirect_to menus_path
      return
    end

    @random_menu = RandomMenu.new(random_menu_params)
    @random_menu.customer_id = current_customer.id
    @random_menu.monday = @cooks[0].id
    @random_menu.tuesday = @cooks[1].id
    @random_menu.wednesday = @cooks[2].id
    @random_menu.thursday = @cooks[3].id
    @random_menu.friday = @cooks[4].id
    @random_menu.saturday = @cooks[5].id
    @random_menu.sunday = @cooks[6].id

    if @random_menu.save
      redirect_to menu_path(@random_menu)
    else
      @random_menus = RandomMenu.where(customer_id: current_customer.id)
      render :index
    end
  end

  def show
    @random_menu = RandomMenu.where(id: params[:id])
    @cooks = Cook.where(id:
        @random_menu.pluck(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday).first
    )
  end

  def destroy
    random_menu = RandomMenu.find(params[:id])
    random_menu.destroy if random_menu.customer_id == current_customer.id
    redirect_to menus_path
  end

  private
  def random_menu_params
    params.require(:random_menu).permit(:title)
  end
end
