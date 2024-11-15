class FeedbacksController < ApplicationController
  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]

    # Викликаємо mailer для відправки листа
    FeedbackMailer.send_feedback(name, email, message).deliver_now

    # Перенаправляємо з повідомленням про успіх
    redirect_to root_path, notice: 'Ваше повідомлення було успішно відправлено!'
  end
end
