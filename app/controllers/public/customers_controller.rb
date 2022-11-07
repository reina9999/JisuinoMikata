class Public::CustomersController < ApplicationController
   before_action :ensure_guest_customer, only: [:edit]
   
   
  # def ensure_guest_user
  #   @customer = Customer.find(params[:id])
  #   if @customer.name == "guestcustomer"
  #     redirect_to _path() , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
  #   end
  # end  
end
