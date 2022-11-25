class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index #会員一覧
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show #会員詳細
    @customer = Customer.find(params[:id])
  end

  def edit #会員ステータス変更
    @customer = Customer.find(params[:id])
  end

  def update #会員ステータスの更新
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer) #会員詳細画面へ
    else
      redirect_to request.referer #会員詳細画面へ戻る
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name,:email,:is_deleted)
  end
end

