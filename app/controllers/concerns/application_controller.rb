class ApplicationController < ActionController::Base
  # before_action :authenticate_customer!,except: [:top,:about]
  before_action :configure_permitted_parameters,if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password])
  end

  # private

  # def after_customer_sign_in_path_for(resource)
  #   cooks_path(resource)
  # end


  # def after_admin_signed_in_path_for(resource)
  #   admin_root_path(resource)
  # end

  # def after_sign_out_path_for(resource)
  #   root_path
  # end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  # end

end
