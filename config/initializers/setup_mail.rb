ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "localhost",
  :domain => "creed.trconsulting.railsplayground.net",
  :user_name => "tmrotz",
  :password => "ender999",
  :authentication => :login
}

#if Rails.env.development?
#  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#else
#  ActionMailer::Base.default_url_options[:host] = "creed.trconsulting.railsplayground.net"
#end