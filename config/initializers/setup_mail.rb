ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "localhost",
  :port => 25,
  :domain => "trconsulting.railsplayground.net",
  :user_name => "travis@trconsulting.railsplayground.net",
  :password => "ender999",
  :authentication => :login
}