class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
  # @customers = Customer.all.page(params[:page]).per(10)
  end
end
