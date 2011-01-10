
ActionMailer::Base.delivery_method = :smtp

if Rails.env.development?
  ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :user_name => "tmrotz",
    :password => "1amAmulek",
    :authentication => "plain",
    :enable_starttls_auto => true
  }
elsif Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    :address => "localhost",
    :port => 25,
    :domain => "creed-bplan.org",
    :user_name => "creed-bplan.org@creed-bplan.org",
    :password => "1amAmulek",
    :authentication => :login,
    :enable_starttls_auto => false
  }
end
