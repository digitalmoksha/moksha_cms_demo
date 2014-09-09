# Throw up a Growl notification for deprecation warnings
#------------------------------------------------------------------------------
if Rails.env.development?
  require 'ruby-growl'
  require 'ruby-growl/ruby_logo'
  
  ActiveSupport::Deprecation.behavior = [:stderr, :notify]
  ActiveSupport::Notifications.subscribe('deprecation.rails') do |name, start, finish, id, payload|
    g = Growl.new "localhost", "ruby-growl"
    g.add_notification("notification", "ruby-growl Notification", Growl::RUBY_LOGO_PNG)
    g.notify "notification", "DEPRECATION WARNING", payload[:message]
  end
end
