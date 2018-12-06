class AdminMailer < ApplicationMailer
  def email
    @user = AdminUser.first
    mail(to: @user.email, subject: 'You have a new post pending your approval')
  end
end
