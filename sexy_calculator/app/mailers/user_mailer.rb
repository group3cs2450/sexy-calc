class UserMailer < ActionMailer::Base
  default from: "admin@mycablecalculator.com"


 
  def welcome_email(order)
  	@order = order
    @user = order.user
    @url  = 'mycablecalculator.com'
    mail(to: @user.email, subject: 'New Order')
  end
end

