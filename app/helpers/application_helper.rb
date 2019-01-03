module ApplicationHelper
  def active?(path)
    "active" if current_page?(path)
  end

  def login_helper
    if current_user.is_a?(GuestUser)
      (link_to "Sign Up", new_user_registration_path, class: 'dropdown-item') +
      (link_to "Login", new_user_session_path, class: 'dropdown-item')
    elsif current_user.type == 'AdminUser'
      (link_to "Conversations", conversations_path, class: 'dropdown-item') +
      (link_to 'Admin Dashboard', admin_root_path, class: 'dropdown-item') + 
      (link_to "Logout", destroy_user_session_path, method: :delete, class: 'dropdown-item')
    else
      (link_to "Conversations", conversations_path, class: 'dropdown-item') +
      (link_to "Logout", destroy_user_session_path, method: :delete, class: 'dropdown-item')
    end
  end

  def non_footer_action
    @skip_footer = true
  end
end
