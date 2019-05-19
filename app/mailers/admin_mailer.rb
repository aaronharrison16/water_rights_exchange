class AdminMailer < ApplicationMailer
  def email
    @user = AdminUser.last
    mail(to: @user.email, subject: 'You have a new post pending your approval')
  end
end
