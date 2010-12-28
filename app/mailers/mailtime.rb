class Mailtime < ActionMailer::Base
  default :from => "tmrotz@gmail.com"

  def welcome
    mail( :to => "tmrotz@gmail.com",
          :subject => "Welcome")
  end
  
end
