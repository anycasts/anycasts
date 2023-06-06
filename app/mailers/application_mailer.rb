class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('SMTP_EMAIL_FROM', 'from@example.com')
  layout 'mailer'
end
