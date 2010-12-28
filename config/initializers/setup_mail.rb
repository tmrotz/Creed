ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "creed.com",
  :user_name => "tmrotz",
  :password => "1amAmulek",
  :authentication => "plain",
  :enable_starttls_auto => true
}