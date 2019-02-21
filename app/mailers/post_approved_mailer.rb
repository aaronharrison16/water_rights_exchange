class PostApprovedMailer < ApplicationMailer
    def email email
        mail(to: email, subject: 'your listing has been approved')
    end
end