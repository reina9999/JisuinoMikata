class Admin::CooksController < ApplicationController
    before_action :authenticate_admin!
    # def index
    #   @cooks = Cook.all.page(params[:page]).per(10)
    # end
    
    def show
      @cook = Cook.find(params[:id])
      @cook_comment = CookComment.where(customer_id: @cook.customer_id)
    end
    
    def edit
      @cook = Cook.find(params[:id]) 
    end
    
    def update
      @cook = Cook.find(params[:id])
      if @cook.update(cook_params)
        redirect_to admin_cook_path(@cook)
      else
        render :edit
      end
    end  
    
    
    
end
