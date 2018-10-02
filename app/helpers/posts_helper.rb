module PostsHelper
  def status_label status
    if status == 'pending'
      content_tag(:span, status.titleize, class: 'alert alert-warning')
    end
  end
end
