class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def receipt_email order_list
    @order_list = order_list
    mail(to: "test@test.com", subject: "Your receipt for order number ")
  end
end
