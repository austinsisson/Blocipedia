class UserMailer < ActionMailer::Base
  def refund_request(user)
    @user = user
    mail(to: 'austinsisson@gmail.com', subject: 'Refund Request', from: 'admin@blocipedia.com')
  end
end