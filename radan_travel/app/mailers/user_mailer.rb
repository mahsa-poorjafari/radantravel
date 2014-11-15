# encoding: UTF-8
class UserMailer < ActionMailer::Base
  def send_user_msg
    @message = Message.last
    mail(:to =>  User.all.collect(&:email).join(','), :subject => "Radan Travel Site", :from => "radanseir.agent@yahoo.com")
  end  
  def customer_register_done
    @customer = Customer.last
    mail(:to =>  @customer.email, :subject => "Radan Travel ", :from => "radanseir.agent@yahoo.com")
  end
end
