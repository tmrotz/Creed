ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "mail.trconsulting.railsplayground.net",
  :port => 26,
  :user_name => "travis+trconsulting.railsplayground.net",
  :password => "ender999",
  :authentication => :login
}

if Rails.env.development?
  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
else
  ActionMailer::Base.default_url_options[:host] = "creed.trconsulting.railsplayground.net"
end