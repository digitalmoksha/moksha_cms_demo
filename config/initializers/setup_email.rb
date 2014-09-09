# settings for the mailing system
#------------------------------------------------------------------------------

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => Rails.application.config.smtp_address,
  :port                 => Rails.application.config.smtp_port,
  :domain               => Rails.application.config.smtp_domain,
  :user_name            => Rails.application.config.smtp_user_name,
  :password             => Rails.application.config.smtp_password,
  :authentication       => Rails.application.config.smtp_authentication,
  :enable_starttls_auto => Rails.application.config.smtp_enable_starttls_auto
}

class DevelopmentMailInterceptor
  def self.delivering_email(message) 
    message.subject = "[DEV #{message.to}] #{message.subject}"
    message.to      = Rails.application.config.development_email
    message.cc      = ''
    message.bcc     = ''
  end
end

ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
