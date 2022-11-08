class Public::CustomersController < ApplicationController
  # before_action :ensure_guest_customer!, {only: [:show,:edit,:update]}
  
  def show
  end
  
  def edit
  end
  
  def confirm
  end
  
  def withdraw
    customer = Customer.find(current_customer.id)
    customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  
  
  # def ensure_guest_user
  #   @customer = Customer.find(params[:id])
  #   if @customer.name == "guestcustomer"
  #     redirect_to _path() , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
  #   end
  # end  
end
