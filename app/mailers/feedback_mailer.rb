class FeedbackMailer < ApplicationMailer
  default from: 'mystore-support@example.com'

  def send_feedback(name, email, message)
    @name = name
    @message = message
    mail(to: email, subject: 'Дякуємо за ваш відгук')
  end
end
