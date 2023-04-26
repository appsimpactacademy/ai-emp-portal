class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  def admin_email
    'kanchan@appsimpact.com'
  end
end
