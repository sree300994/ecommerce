class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.order_notification.subject
  #
  def order_notification(order)
  	@order = order
    mail to: "#{@order.user.email}", subject: "Order confirmed - #{@order.order_number}"
  end

  def review_confirmation(review)
  	@review = review
  	mail to: "#{@review.user.email}", subject: "Review received "
  end

end
