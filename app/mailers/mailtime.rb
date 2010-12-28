class Mailtime < ActionMailer::Base
  default :from => "travis@trconsulting.railsplayground.net"

  def welcome
    mail( :to => "tmrotz@gmail.com",
          :subject => "Welcome")
  end
  
end
