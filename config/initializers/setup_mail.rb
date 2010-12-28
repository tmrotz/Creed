ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.server_settings = {
  :address => "localhost",
  :port => 25,
  :user_name => "travis@trconsulting.railsplayground.net",
  :password => "ender999",
  :authentication => :login
}

if Rails.env.development?
  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
else
  ActionMailer::Base.default_url_options[:host] = "creed.trconsulting.railsplayground.net"
end