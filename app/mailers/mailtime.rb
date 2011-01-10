class Mailtime < ActionMailer::Base
  if Rails.env.production?
    default :from => "creed-bplan@creed-bplan.org"
  elsif Rails.env.development?
    default :from => "tmrotz@gmail.com"
  end

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
