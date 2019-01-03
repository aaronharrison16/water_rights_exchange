module PostsHelper
  def status_label status
    if status == 'pending'
      content_tag(:span, status.titleize, class: 'alert alert-warning alert-custom')
    end
  end
end