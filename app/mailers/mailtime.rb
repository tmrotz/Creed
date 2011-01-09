class Mailtime < ActionMailer::Base
  default :from => "travis@trconsulting.railsplayground.net"

  def welcome(user)
    @user = user
    mail( :to => user.email,
          :subject => "Welcome")
  end

  def hacker(user, subject_text)
    @user = user
    mail( :to => "tmrotz@gmail.com",
          subject => "#{user.first} #{user.last} #{subject_text}")
  end
  
end
