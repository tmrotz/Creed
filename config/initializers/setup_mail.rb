ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "localhost",
  :port => 25,
  :domain => "trconsulting.railsplayground.net",
  :user_name => "trconsul",
  :password => "1amAmulek",
  :authentication => :login
}

#if Rails.env.development?
#  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#else
#  ActionMailer::Base.default_url_options[:host] = "creed.trconsulting.railsplayground.net"
#end