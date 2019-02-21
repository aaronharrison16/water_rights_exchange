class PostApprovedMailer < ApplicationMailer
    def mail email
        mail(to: email, subject: 'Your post has been approved!')
    end
end