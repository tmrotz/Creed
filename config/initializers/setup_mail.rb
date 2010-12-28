ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "mail.trconsulting.railsplayground.net",
  :port => 26,
  :user_name => "trconsul",
  :password => "1amAmulek",
  :authentication => :login
}