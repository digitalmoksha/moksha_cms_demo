# Load configuration values in system_config.yml
#------------------------------------------------------------------------------
begin
  YAML::load_file(config_file = Rails.root.join('config', 'system_config.yml'))[Rails.env].each do |k, v|
    Rails.application.config.send("#{k}=", v)
  end
  Rails.application.config.action_mailer.default_url_options = { :host => Rails.application.config.base_domain }
rescue Exception => error
  puts "Error initializing Basha: Issue processing config file #{config_file}.\n\nError is: #{error}"
end
