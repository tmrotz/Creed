ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "trconsulting.railsplayground.net",
  :port => 25,
  :domain => "trconsulting.railsplayground.net",
  :user_name => "trconsul",
  :password => "1amAmulek",
  :authentication => :login
}