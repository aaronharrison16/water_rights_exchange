module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
  
    def authenticate_admin
      unless current_user.try(:type) == 'AdminUser'
        flash[:alert] = "You are not authorized to access this page"
        redirect_to(root_path)
      end
    end
  end
end
