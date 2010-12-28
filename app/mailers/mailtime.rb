class Mailtime < ActionMailer::Base
  default :from => "tmrotz@gmail.com"

  def welcome(user)
    mail( :to => user.email,
          :subject => "Welcome")
  end
  
end
