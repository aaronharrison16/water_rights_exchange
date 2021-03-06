class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  include DeviseWhitelist
  include Pundit 
  include CurrentUserConcern

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
