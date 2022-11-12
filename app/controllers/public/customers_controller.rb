class Public::CustomersController < ApplicationController
  # before_action :ensure_guest_customer!, only: [:edit]

  def show
    @customer = Customer.find(params[:id])
    @cook=Cook.new
    @cook_comment = CookComment.new
  end

  def edit
    @customer = Customer.find(params[:id])
    unless @customer.email == "guest@example.com"
      @customer = Customer.find(params[:id])
    else
      redirect_to customer_path(@customer.id)
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
    @cooks = current_customer.cooks
  end


  private

  def ensure_guest_user
    @customer = Customer.find(params[:id])
    if @customer.name == "guestcustomer"
      redirect_to customers_path, notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
