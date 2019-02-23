class PostApprovedMailer < ApplicationMailer
    def email user_email
        mail(to: user_email, subject: 'Your post has been approved!')
    end
end