class AdminMailer < ApplicationMailer
  def email admin
    @admin = admin
    mail(to: @admin.email, subject: 'You have a new post pending your approval')
  end
end
