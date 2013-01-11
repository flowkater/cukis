ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "cukis.net",
  :user_name            => "help@cukis.net",
  :password             => "Zodlxj10",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp

if Rails.env.development?
  ActionMailer::Base.default_url_options[:host] = "127.0.0.1:3000"
else
  ActionMailer::Base.default_url_options[:host] = "cukis.net"
end

