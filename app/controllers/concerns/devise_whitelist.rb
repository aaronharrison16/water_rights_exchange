module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_perameters, if: :devise_controller?
  end


  def configure_permitted_perameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :number])
  end
end