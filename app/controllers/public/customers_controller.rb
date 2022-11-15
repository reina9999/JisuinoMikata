class Public::CustomersController < ApplicationController
  # before_action :ensure_guest_customer!, only: [:edit]

  def show
    @customer = Customer.find(params[:id])
    @cook=Cook.new
    @cook_comment = CookComment.new
    @cooks = @customer.cooks.order("created_at DESC").page(params[:page]).per(5)
    # binding.irb
  end

  def edit
    @customer = Customer.find(params[:id])
    unless @customer.email == "guest@example.com"
      @customer = Customer.find(params[:id])
    else
      redirect_to customer_path(@customer.id)
    end
  end

  def update
     @customer = Customer.find(params[:id])
    if @customer.update!(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end

  def confirm
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
  end


  def withdraw

    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def bookmarks
    # binding.irb
    # @bookmarks = current_customer.bookmarks

    # bookmarkIds = Customer.find(params[:id]).bookmarks.pluck(:cook_id)
    bookmarkIds = current_customer.bookmarks.pluck(:cook_id)
    @cooks = Cook.find(bookmarkIds)
  end


  private
  def customer_params
    params.require(:customer).permit(:name, :email, :password)
  end


  def ensure_guest_user
    @customer = Customer.find(params[:id])
    if @customer.name == "guestcustomer"
      redirect_to customers_path, notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
