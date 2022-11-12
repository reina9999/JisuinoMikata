class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
     if @customer.update(customer_params)
       redirect_to admin_customer_path(@customer)
     else
         redirect_to request.referer
     end
  end

  private

  def customer_params
    params.require(:customer).permit(:name,:email,:is_deleted)
  end
end

